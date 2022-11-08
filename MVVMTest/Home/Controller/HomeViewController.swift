import UIKit

class HomeViewController: UIViewController {
    private var screen: HomeScreenView?
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.screen = HomeScreenView()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUsersDataRequest()
    }
}

//MARK: - ViewModelDelegate (Status request)
extension HomeViewController: HomeViewModelDelegate {
    func successRequest() {
        screen?.setupTableViewProtocols(delegate: self, dataSource: self)
        screen?.reloadTableView()
    }

    func errorRequest() {
        print("Error de request")
    }
}

//MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numbersOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? CustomCellTableViewCell else { fatalError()}
        cell.setupCell(with: viewModel.loadCurrentUser(indexPath: indexPath))
        cell.delegate(delegate: self)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModel.getName(indexPath: indexPath))
    }
}

//MARK: - CustomCellTableViewCellDelegate
extension HomeViewController: CustomCellTableViewCellDelegate {
    func didButtonHeartTapped(user: User) {
        viewModel.updateHeartState(user: user)
    }
}
