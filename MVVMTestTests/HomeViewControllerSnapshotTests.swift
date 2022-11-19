import XCTest
import SnapshotTesting
@testable import MVVMTest

class HomeViewControllerSnapshotTests: XCTestCase {
    
    func test_homeSreenImage() {
        isRecording = false
        
        let stub = APIServiceStub()
        stub.userDataToBeReturned = UsersData(group: [
            .fixture(name: "Edgar"),
            .fixture(name: "Leonardo"),
            .fixture(name: "George Orwell", profession: "Author"),
            .fixture(name: "Freud", profession: "Author")
        ])
        
        let viewModelMock = HomeViewModelMock(mockService: stub)
        let sut = HomeViewController(viewModel: viewModelMock)
        assertSnapshot(matching: sut, as: .image)
    }
}
