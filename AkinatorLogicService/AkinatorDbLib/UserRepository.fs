namespace AkinatorDbLib

open System
open Npgsql
open Serilog
open Serilog.Events
open System.Security.Cryptography
open System.Text

module UserRepository =
    let private connectionString = 
        match Environment.GetEnvironmentVariable("POSTGRES_CONNECTION_STRING") with
        | null -> "Host=localhost;Database=akinator_db;Username=akinator_user;Password=akinator_password"
        | value -> value
    
    let private logger = 
        LoggerConfiguration()
            .MinimumLevel.Debug()
            .WriteTo.Console()
            .WriteTo.File("logs/user_repo.log", rollingInterval = RollingInterval.Day)
            .CreateLogger()

    let private hashPassword (password: string) : string =
        use sha256 = SHA256.Create()
        let bytes = Encoding.UTF8.GetBytes(password)
        let hash = sha256.ComputeHash(bytes)
        Convert.ToBase64String(hash)

    let private executeScalar<'T> (query: string) (parameters: (string * obj) list) : 'T option =
        try
            use connection = new NpgsqlConnection(connectionString)
            connection.Open()
            use command = new NpgsqlCommand(query, connection)
            for (name, value) in parameters do
                command.Parameters.AddWithValue(name, value) |> ignore
            let result = command.ExecuteScalar()
            if result <> null && result <> box DBNull.Value then
                Some (result :?> 'T)
            else
                None
        with
        | ex -> 
            logger.Error(ex, "Ошибка при выполнении скалярного запроса: {Query}", query)
            None

    let private executeQuery<'T> (query: string) (parameters: (string * obj) list) (mapper: NpgsqlDataReader -> 'T) : 'T option =
        try
            use connection = new NpgsqlConnection(connectionString)
            connection.Open()
            use command = new NpgsqlCommand(query, connection)
            for (name, value) in parameters do
                command.Parameters.AddWithValue(name, value) |> ignore
            use reader = command.ExecuteReader()
            if reader.Read() then
                Some (mapper (reader :?> NpgsqlDataReader))
            else
                None
        with
        | ex -> 
            logger.Error(ex, "Ошибка при выполнении запроса: {Query}", query)
            None

    let private executeQueryList<'T> (query: string) (parameters: (string * obj) list) (mapper: NpgsqlDataReader -> 'T) : 'T list =
        try
            use connection = new NpgsqlConnection(connectionString)
            connection.Open()
            use command = new NpgsqlCommand(query, connection)
            for (name, value) in parameters do
                command.Parameters.AddWithValue(name, value) |> ignore
            use reader = command.ExecuteReader()
            let mutable results = []
            while reader.Read() do
                results <- mapper (reader :?> NpgsqlDataReader) :: results
            results |> List.rev
        with
        | ex -> 
            logger.Error(ex, "Ошибка при выполнении запроса списка: {Query}", query)
            []

    let private executeNonQuery (query: string) (parameters: (string * obj) list) : bool =
        try
            use connection = new NpgsqlConnection(connectionString)
            connection.Open()
            use command = new NpgsqlCommand(query, connection)
            for (name, value) in parameters do
                command.Parameters.AddWithValue(name, value) |> ignore
            command.ExecuteNonQuery() > 0
        with
        | ex -> 
            logger.Error(ex, "Ошибка при выполнении команды: {Query}", query)
            false

    let private mapUser (reader: NpgsqlDataReader) : User =
        let idOrdinal = reader.GetOrdinal("id")
        let usernameOrdinal = reader.GetOrdinal("username")
        let passwordHashOrdinal = reader.GetOrdinal("password_hash")
        let createdAtOrdinal = reader.GetOrdinal("created_at")
        let lastLoginAtOrdinal = reader.GetOrdinal("last_login_at")
        
        {
            Id = reader.GetInt32(idOrdinal)
            Username = reader.GetString(usernameOrdinal)
            PasswordHash = reader.GetString(passwordHashOrdinal)
            CreatedAt = reader.GetDateTime(createdAtOrdinal)
            LastLoginAt = 
                if reader.IsDBNull(lastLoginAtOrdinal) then 
                    None 
                else 
                    Some(reader.GetDateTime(lastLoginAtOrdinal))
        }

    let getUserById (id: int) : User option = 
        let query = "SELECT id, username, password_hash, created_at, last_login_at FROM users WHERE id = @id"
        let parameters = [("@id", box id)]
        executeQuery query parameters mapUser

    let getUserByUsername (username: string) : User option = 
        let query = "SELECT id, username, password_hash, created_at, last_login_at FROM users WHERE username = @username"
        let parameters = [("@username", box username)]
        executeQuery query parameters mapUser

    let getAllUsers () : User list = 
        let query = "SELECT id, username, password_hash, created_at, last_login_at FROM users ORDER BY created_at DESC"
        executeQueryList query [] mapUser

    let createUser (username: string) (passwordHash: string) (createdAt: DateTime) : User option = 
        let query = """
            INSERT INTO users (username, password_hash, created_at)
            VALUES (@username, @password_hash, @created_at)
            RETURNING id, username, password_hash, created_at, last_login_at
        """
        let parameters = [
            ("@username", box username)
            ("@password_hash", box passwordHash)
            ("@created_at", box createdAt)
        ]
        executeQuery query parameters mapUser

    let updateUser (id: int) (username: string) (passwordHash: string) : User option = 
        let query = """
            UPDATE users 
            SET username = @username, password_hash = @password_hash
            WHERE id = @id
            RETURNING id, username, password_hash, created_at, last_login_at
        """
        let parameters = [
            ("@id", box id)
            ("@username", box username)
            ("@password_hash", box passwordHash)
        ]
        executeQuery query parameters mapUser

    let deleteUser (id: int) : bool = 
        let query = "DELETE FROM users WHERE id = @id"
        let parameters = [("@id", box id)]
        executeNonQuery query parameters

    let registerUser (username: string) (password: string) : bool = 
        try
            match getUserByUsername username with
            | Some _ -> 
                logger.Warning("Попытка регистрации существующего пользователя: {Username}", username)
                false
            | None ->
                let hashedPassword = hashPassword password
                let query = """
                    INSERT INTO users (username, password_hash, created_at)
                    VALUES (@username, @password_hash, @created_at)
                """
                let parameters = [
                    ("@username", box username)
                    ("@password_hash", box hashedPassword)
                    ("@created_at", box DateTime.UtcNow)
                ]
                let result = executeNonQuery query parameters
                if result then
                    logger.Information("Пользователь успешно зарегистрирован: {Username}", username)
                result
        with
        | ex ->
            logger.Error(ex, "Ошибка при регистрации пользователя: {Username}", username)
            false

    let loginUser (username: string) (password: string) : string option = 
        try
            let hashedPassword = hashPassword password
            let query = """
                SELECT id FROM users 
                WHERE username = @username AND password_hash = @password_hash
            """
            let parameters = [
                ("@username", box username)
                ("@password_hash", box hashedPassword)
            ]
            
            match executeScalar<int> query parameters with
            | Some userId -> 
                // Обновляем время последнего входа
                let updateQuery = "UPDATE users SET last_login_at = @now WHERE id = @id"
                let updateParams = [("@now", box DateTime.UtcNow); ("@id", box userId)]
                executeNonQuery updateQuery updateParams |> ignore
                
                // Создаем простой токен (в продакшене использовать JWT)
                let token = Convert.ToBase64String(Encoding.UTF8.GetBytes($"{username}:{DateTime.UtcNow.Ticks}"))
                logger.Information("Успешная авторизация пользователя: {Username}", username)
                Some token
            | None -> 
                logger.Warning("Неудачная попытка авторизации: {Username}", username)
                None
        with
        | ex ->
            logger.Error(ex, "Ошибка при авторизации пользователя: {Username}", username)
            None 