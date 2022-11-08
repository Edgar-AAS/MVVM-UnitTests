import XCTest
@testable import MVVMTest

class CustomCellViewModelTests: XCTestCase {
    func test_getName_whenCalled_shouldReturn_formattedName() {
        let sut = CustomCellViewModel(data: User.fixture(name: "Edgar Arlindo"))
        let formattedName = sut.getName
        XCTAssertEqual(formattedName, "Nome: Edgar Arlindo")
    }
    
    func test_getProfession_whenCalled_shoudReturn_formattedProfession() {
        let sut = CustomCellViewModel(data: User.fixture(profession: "iOS Developer"))
        let formattedProfession = sut.getProfession
        XCTAssertEqual(formattedProfession, "Profissao: iOS Developer")
    }
    
    func test_getSalary_whenCalled_shouldReturn_formattedSalary() {
        let sut = CustomCellViewModel(data: User.fixture(salary: "5000,00"))
        let formattedSalary = sut.getSalary
        XCTAssertEqual(formattedSalary, "Salario: R$ 5000,00")
    }
    
    func test_getAge_whenCalled_shouldReturn_formattedAge() {
        let sut = CustomCellViewModel(data: User.fixture(age: 23))
        let formattedAge = sut.getAge
        XCTAssertEqual(formattedAge, "Idade: 23")
    }
    
    func test_getUserImage_whenCalled_shouldReturn_userImageStringName() {
        let sut = CustomCellViewModel(data: User.fixture(imageUser: "person.circle"))
        let userImageStringName = sut.getUserImage
        XCTAssertEqual(userImageStringName, "person.circle")
    }
    
    func test_getIsEnableHeart_whenCalled_shoudReturn_booleanValueRespective() {
        let sut = CustomCellViewModel(data: User.fixture(isEnableHeart: false))
        let isEnableHeart = sut.getIsEnableHeart
        XCTAssertFalse(isEnableHeart)
    }
    
    func test_exchangeEnableHeart_whenCalled_changeIsEnableHeartValue() {
        let sut = CustomCellViewModel(data: User.fixture(isEnableHeart: false))
        let isEnableHeart = sut.getIsEnableHeart
        sut.exchangeEnableHeart(value: true)
        XCTAssertNotEqual(isEnableHeart, sut.getIsEnableHeart)
    }
    
    func test_getUser_whenCalled_shouldBeReturn_User() {
        let user = User.fixture()
        let sut = CustomCellViewModel(data: user)
        XCTAssertEqual(sut.getUser, user)
    }
}
