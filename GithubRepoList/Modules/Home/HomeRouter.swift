//
//  HomeRouter.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 08/06/2021.
//

import UIKit

protocol HomeRouter {
    typealias Route = HomeViewController.HomeRoute
    
    var viewController: HomeViewController! { get }
    init(viewController: HomeViewController)
    
    func navigate(to route: Route, data: GithubRepoElement)
}

class DefaultHomeRouter: HomeRouter {
    
    weak var viewController: HomeViewController!
    
    required init(viewController: HomeViewController) {
        self.viewController = viewController
    }
    
    func navigate(to route: Route, data: GithubRepoElement) {
        switch route {
        case .repositoryDetails:
            passDataToRepositoryDetails(route, data: data)
        }
    }
    
}

// MARK: - Extension for passing data logic
extension DefaultHomeRouter {
    private func passDataToRepositoryDetails(_ route: Route, data: GithubRepoElement) {
        let repoDetailsVC = RepositoryDetailsViewController(with: data)
        viewController.navigationController?.pushViewController(repoDetailsVC, animated: true)
    }
}
