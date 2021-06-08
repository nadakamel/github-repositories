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
    
    func navigate(to route: Route)
}

class DefaultHomeRouter: HomeRouter {
    
    weak var viewController: HomeViewController!
    
    required init(viewController: HomeViewController) {
        self.viewController = viewController
    }
    
    func navigate(to route: Route) {
        switch route {
        case .repositoryDetails:
            passDataToRepositoryDetails(route)
        }
    }
    
}

// MARK: - Extension for passing data logic
extension DefaultHomeRouter {
    private func passDataToRepositoryDetails(_ route: Route) {
        let repoDetailsVC = RepositoryDetailsViewController()
        viewController.navigationController?.pushViewController(repoDetailsVC, animated: true)
    }
}
