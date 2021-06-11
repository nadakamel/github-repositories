//
//  NetworkAPI.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import Foundation

enum NetworkAPI {
    case getPublicRepos
    case getRepoDetails(repoFullname: String)
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
        switch self {
        case .getPublicRepos:
            return "/repositories"
        case .getRepoDetails(let repoFullname):
            return "/repos/\(repoFullname)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getPublicRepos, .getRepoDetails:
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
