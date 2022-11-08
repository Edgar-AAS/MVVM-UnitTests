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
    var fetchDataFromAPICallCount = 0
    var fetchUsersDataRequestIsCalled: Bool = false
    
    func fetchDataFromAPI(completion: @escaping completion<UsersData?>) {
        fetchUsersDataRequestIsCalled = true
        fetchDataFromAPICallCount += 1
        completion(userDataToBeReturned, nil)
    }
}
