import Foundation

struct UsersData: Decodable, Equatable {
    let group: [User]
}

struct User: Decodable, Equatable {
    let name: String
    let age: Int
    let profession: String
    let salary: String
    let imageUser: String
    var isEnableHeart: Bool
    let identifier: Int
}   
