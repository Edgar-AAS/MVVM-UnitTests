import Foundation
@testable import MVVMTest

extension User {
    static func fixture(
        name: String =  "Ronaldinho",
        age: Int = 1,
        profession: String = "iOS developer",
        salary: String = "1200",
        imageUser: String = "heart_fill",
        isEnableHeart: Bool = true,
        identifier: Int =  1)
    -> Self {
        .init(name: name,
             age: age,
             profession: profession,
             salary: salary,
             imageUser: imageUser,
             isEnableHeart: isEnableHeart,
             identifier: identifier)
    }
}
