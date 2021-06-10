//
//  NetworkManager.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case forbiddenRequest = "Forbidden Request"
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed, please try again."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}

typealias CompletionHandler = (_ data: Any?,_ error: String?) -> Void

protocol NetworkManager {
    func sendRequest(apiMethod: NetworkAPI, completion: @escaping CompletionHandler)
}

class NetworkManagerImp: NetworkManager {
    private let router = Router<NetworkAPI>()
    
    func sendRequest(apiMethod: NetworkAPI, completion: @escaping CompletionHandler) {
        router.request(apiMethod) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard data != nil else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    completion(data, nil)
                case .failure(let responseError):
                    completion(nil, responseError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
//        case 403: return .failure(NetworkResponse.forbiddenRequest.rawValue)
//        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
}
