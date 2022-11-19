import XCTest
@testable import MVVMTest

class HomeViewModelTests: XCTestCase {
    private let serviceSpy = APIServiceStub()
    private let delegateSpy = HomeViewModelDelegateSpy()
    private lazy var sut = HomeViewModel(service: serviceSpy)
    
    func test_fetchUsersDataRequest_shouldCall_serviceFetchDataFromAPI() {
        sut.fetchUsersDataRequest()
        XCTAssertTrue(serviceSpy.fetchUsersDataRequestIsCalled)
    }
    
    func test_fetchUsersDataRequest_shouldCall_serviceFetchDataFromAPIOnce() {
        sut.fetchUsersDataRequest()
        XCTAssertEqual(serviceSpy.fetchDataFromAPICallCount, 1)
    }
    
    func test_fetchUsersDataRequest_when_userDataIsNil_shouldCall_delegateErrorRequest() {
        serviceSpy.userDataToBeReturned = nil
        sut.delegate = delegateSpy
        sut.fetchUsersDataRequest()
        XCTAssertTrue(delegateSpy.errorRequestIsCalled)
    }
    
    func test_fetchUsersDataRequest_when_userDataIsNotNil_shouldCall_delegateSuccessRequest() {
        let user = User.fixture(name: "Edgar")
        serviceSpy.userDataToBeReturned = UsersData(group: [user])
        sut.delegate = delegateSpy
        sut.fetchUsersDataRequest()
        XCTAssertTrue(delegateSpy.successRequestIsCalled)   
    }

    func test_numberOfRows_shouldBeReturned() {
        let user = User.fixture()
        serviceSpy.userDataToBeReturned = UsersData(group: [user])
        sut.fetchUsersDataRequest()
        XCTAssertEqual(sut.numbersOfRows, 1)
    }
    
    func test_loadCurrentUser_shouldReturn_user_when_indexPathIsPassed() {
        let user = User.fixture(name: "Edgar", salary: "5000")
        let indexPath = IndexPath(row: 0, section: 0)
        serviceSpy.userDataToBeReturned = UsersData(group: [user])
        sut.fetchUsersDataRequest()
        XCTAssertEqual(sut.loadCurrentUser(indexPath: indexPath), User.fixture(name: "Edgar", salary: "5000"))
    }
    
    func test_getName_shouldReturn_name_when_indexPathIsPassed() {
        let user = User.fixture(name: "Edgar")
        let indexPath = IndexPath(row: 0, section: 0)
        serviceSpy.userDataToBeReturned = UsersData(group: [user])
        sut.fetchUsersDataRequest()
        XCTAssertEqual(sut.getName(indexPath: indexPath), "Edgar")
    }
    
    func test_updateHeartState_shouldChangeUser_when_idetifiersIsEqual() {
        let userTrue = User.fixture(isEnableHeart: true, identifier: 1)
        
        serviceSpy.userDataToBeReturned = UsersData(group: [userTrue])
        sut.fetchUsersDataRequest()
        
        let userFalse = User.fixture(isEnableHeart: false, identifier: 1)

        sut.updateHeartState(user: userFalse)
        let indexPath = IndexPath(row: 0, section: 0)
        XCTAssertEqual(sut.loadCurrentUser(indexPath: indexPath), userFalse)
    }
    
    func test_getNumbersOfSection() {
        XCTAssertEqual(sut.getNumbersOfSections(), 1)
    }
}
