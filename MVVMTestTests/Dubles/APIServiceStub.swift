//
//  APIServiceSpy.swift
//  MVVMTestTests
//
//  Created by Leonardo Almeida on 07/11/22.
//

import Foundation
@testable import MVVMTest

class APIServiceStub: NetworkService {
    var userDataToBeReturned: UsersData?
    private(set) var fetchDataFromAPICallCount = 0
    private(set) var fetchUsersDataRequestIsCalled: Bool = false
    
    
    func fetchDataFromAPI(completion: @escaping completion<UsersData?>) {
        fetchUsersDataRequestIsCalled = true
        fetchDataFromAPICallCount += 1
        completion(userDataToBeReturned, nil)
    }
}
