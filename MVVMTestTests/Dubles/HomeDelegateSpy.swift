import Foundation
@testable import MVVMTest

class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    private(set) var successRequestIsCalled = false
    private(set) var errorRequestIsCalled = false

    func successRequest() {
        successRequestIsCalled = true
    }

    func errorRequest() {
        errorRequestIsCalled = true
    }
}
