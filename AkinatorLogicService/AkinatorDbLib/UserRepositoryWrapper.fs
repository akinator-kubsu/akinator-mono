namespace AkinatorDbLib

open System

[<AbstractClass; Sealed>]
type UserRepositoryWrapper() =
    static member GetUserById(id: int) : User option = UserRepository.getUserById id
    static member GetUserByUsername(username: string) : User option = UserRepository.getUserByUsername username
    static member GetAllUsers() : User list = UserRepository.getAllUsers()
    static member CreateUser(username: string, passwordHash: string, createdAt: DateTime) : User option = 
        UserRepository.createUser username passwordHash createdAt
    static member UpdateUser(id: int, username: string, passwordHash: string) : User option = 
        UserRepository.updateUser id username passwordHash
    static member DeleteUser(id: int) : bool = UserRepository.deleteUser id
    static member RegisterUser(username: string, password: string) : bool = 
        UserRepository.registerUser username password
    static member LoginUser(username: string, password: string) : string option = 
        UserRepository.loginUser username password 