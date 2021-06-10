//
//  NetworkAPI.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import Foundation

enum NetworkAPI {
    case getPublicRepos
}

extension NetworkAPI: EndpointType {
    
    private var urlString: String {
        return "https://api.github.com"
    }
    
    var baseURL: URL {
        guard let url = URL(string: urlString) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        return "/repositories"
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getPublicRepos:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var task: HTTPTask {
        return .request
    }

}
