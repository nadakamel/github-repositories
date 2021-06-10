//
//  EndpointType.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import Foundation

typealias HTTPHeaders = [String: String]

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
