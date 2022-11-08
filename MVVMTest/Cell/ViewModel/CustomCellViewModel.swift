import Foundation

class CustomCellViewModel {
    private enum DiscriptionCustomCell: String {
        case name = "Nome: "
        case profession = "Profissao: "
        case salary = "Salario: R$ "
        case age = "Idade: "
    }
    
    private var user: User
    
    init(data: User) {
        self.user = data
    }
    
    var getName: String {
        return DiscriptionCustomCell.name.rawValue + user.name
    }

    var getProfession: String {
        return DiscriptionCustomCell.profession.rawValue + user.profession
    }
    
    var getSalary: String {
        return DiscriptionCustomCell.salary.rawValue + user.salary
    }
    
    var getAge: String {
        return DiscriptionCustomCell.age.rawValue + String(user.age)
    }
    
    var getUserImage: String {
        return user.imageUser
    }

    var getIsEnableHeart: Bool {
        return user.isEnableHeart
    }
    
    func exchangeEnableHeart(value: Bool) {
        user.isEnableHeart = value
    }
    
    var getUser: User {
        return user
    }
}
