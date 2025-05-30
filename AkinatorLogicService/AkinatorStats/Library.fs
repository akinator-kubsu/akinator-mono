namespace AkinatorStats

open System
open Npgsql
open Serilog
open Serilog.Events

module Stats =
    
    let private connectionString = 
        match Environment.GetEnvironmentVariable("POSTGRES_CONNECTION_STRING") with
        | null -> "Host=localhost;Database=akinator_db;Username=akinator_user;Password=akinator_password"
        | value -> value
    
    let private logger = 
        LoggerConfiguration()
            .MinimumLevel.Debug()
            .WriteTo.Console()
            .WriteTo.File("logs/stats.log", rollingInterval = RollingInterval.Day)
            .CreateLogger()

    let private executeQuery query =
        try
            use connection = new NpgsqlConnection(connectionString)
            connection.Open()
            use command = new NpgsqlCommand(query, connection)
            command.ExecuteScalar() :?> int64 |> int
        with
        | ex -> 
            logger.Error(ex, "Ошибка при выполнении запроса: {Query}", query)
            0 // Возвращаем 0 вместо исключения

    let getUserCount () =
        logger.Debug("Получение количества пользователей")
        executeQuery "SELECT COUNT(*) FROM users"

    let getSessionCount () =
        logger.Debug("Получение количества сессий")
        executeQuery "SELECT COUNT(*) FROM sessions"
