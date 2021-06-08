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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Github Repositories"
        view.backgroundColor = UIColor.white
    }


}
