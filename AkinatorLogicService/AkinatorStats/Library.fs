namespace AkinatorStats

open System
open Microsoft.Data.Sqlite
open Serilog
open Serilog.Events

module Stats =
    
    let connectionString = "Data Source=akinator.db"
    
    let private logger = 
        LoggerConfiguration()
            .MinimumLevel.Debug()
            .WriteTo.Console()
            .WriteTo.File("logs/stats.log", rollingInterval = RollingInterval.Day)
            .CreateLogger()

    let private executeQuery query =
        try
            use connection = new SqliteConnection(connectionString)
            connection.Open()
            use command = new SqliteCommand(query, connection)
            command.ExecuteScalar() :?> int64 |> int
        with
        | ex -> 
            logger.Error(ex, "Ошибка при выполнении запроса: {Query}", query)
            raise ex

    let getUserCount () =
        logger.Debug("Получение количества пользователей")
        executeQuery "SELECT COUNT(*) FROM Users"

    let getSessionCount () =
        logger.Debug("Получение количества сессий")
        executeQuery "SELECT COUNT(*) FROM Sessions"
