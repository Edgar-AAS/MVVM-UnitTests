//
//  HomeDelegateSpy.swift
//  MVVMTestTests
//
//  Created by Leonardo Almeida on 07/11/22.
//

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
