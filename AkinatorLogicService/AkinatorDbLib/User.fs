namespace AkinatorDbLib

open System

[<CLIMutable>]
type User = {
    Id: int
    Username: string
    PasswordHash: string
    CreatedAt: DateTime
    LastLoginAt: DateTime option
} 