namespace AkinatorStats

open System
open Microsoft.Data.Sqlite

module Stats =
    
    let connectionString = "Data Source=akinator.db"

    let getUserCount () =
        use connection = new SqliteConnection(connectionString)
        connection.Open()
        use command = new SqliteCommand("SELECT COUNT(*) FROM Users", connection)
        command.ExecuteScalar() :?> int64 |> int

    let getSessionCount () =
        use connection = new SqliteConnection(connectionString)
        connection.Open()
        use command = new SqliteCommand("SELECT COUNT(*) FROM Sessions", connection)
        command.ExecuteScalar() :?> int64 |> int
