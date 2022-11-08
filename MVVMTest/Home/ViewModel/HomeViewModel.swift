import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func successRequest()
    func errorRequest()
}

class HomeViewModel {
    private let service: NetworkService?
    private var listUser: [User] = []
        
    init(service: NetworkService?) {
        self.service = service
    }
    
    weak var delegate: HomeViewModelDelegate?
    
    func fetchUsersDataRequest() {
        service?.fetchDataFromAPI(completion: { (data, error) in
            if let usersData = data {
                self.listUser = usersData.group
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
        })
    }
    
    var numbersOfRows: Int {
        return listUser.count
    }
    
    func loadCurrentUser(indexPath: IndexPath) -> User {
        return listUser[indexPath.row]
    }
    
    func getName(indexPath: IndexPath) -> String {
        return listUser[indexPath.row].name
    }
    
    func updateHeartState(user: User) {
        if let row = listUser.firstIndex(where: { user.identifier == $0.identifier }) {
            listUser[row] = user
        }
    }
}
