import Foundation
@testable import MVVMTest

class HomeViewModelMock: HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate?
    
    var userData: [User] = []
    
    private(set) var service: NetworkService?
    
    init(mockService: NetworkService) {
        self.service = mockService
    }
    
    func fetchUsersDataRequest() {
        service?.fetchDataFromAPI(completion: { (data, error) in
            if let data = data {
                self.userData = data.group
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
        })
    }
    
    var numbersOfRows: Int {
        return userData.count
    }
    
    func loadCurrentUser(indexPath: IndexPath) -> User {
        return userData[indexPath.row]
    }
    
    func getName(indexPath: IndexPath) -> String {
        return userData[indexPath.row].name
    }
    
    func updateHeartState(user: User) {
        
    }
    
    func getNumbersOfSections() -> Int {
        return 1
    }
}
