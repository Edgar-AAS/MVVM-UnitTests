//
//  Service.swift
//  MVVMTest
//
//  Created by Leonardo Almeida on 07/11/22.
//

import Foundation

enum Error: Swift.Error {
    case invalidData
    case invalidResponse    
    case badURL
    case decodeError
}

protocol GenericService {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

protocol NetworkService: GenericService {
    func fetchDataFromAPI(completion: @escaping completion<UsersData?>)
}

class APIService: NetworkService {
    let urlString = "https://run.mocky.io/v3/7ef09aa5-f63d-49a0-9fea-737d10ae3c62"
    
    func fetchDataFromAPI(completion: @escaping completion<UsersData?>) {
        guard let urlService = URL(string: urlString) else {
            return completion(nil, .badURL)
        }
        
        URLSession.shared.dataTask(with: urlService) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }
            
            if 200...299 ~= response.statusCode {
                guard let serviceData = data else {
                    completion(nil, .invalidData)
                    return
                }
                
                do {
                    let usersData = try JSONDecoder().decode(UsersData.self, from: serviceData)
                    DispatchQueue.main.async {
                        completion(usersData, nil)
                    }
                } catch {
                    completion(nil, .decodeError)
                }
            }
        }.resume()
    }
}
