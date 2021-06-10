//
//  HomeViewController.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 08/06/2021.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Routes
    enum HomeRoute: String {
        case repositoryDetails
    }
    
    // MARK: Variables
    var router: HomeRouter!
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Github Repositories"
        view.backgroundColor = UIColor.white
        
        viewModel.fetchPublicRepos(completion: { (result, errorMessage) in
            if errorMessage != nil {
                self.showAlertView(withTitle: "Error", andMessage: errorMessage, shouldDismissView: false)
            } else {
                print(result)
            }
        })
    }
    
    
}
