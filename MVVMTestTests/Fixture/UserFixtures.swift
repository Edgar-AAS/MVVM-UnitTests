import Foundation
@testable import MVVMTest

extension User {
    static func fixture(
        name: String =  "Edgar Arlindo",
        age: Int = 23,
        profession: String = "iOS Developer",
        salary: String = "3500,00",
        imageUser: String = "person.circle",
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
