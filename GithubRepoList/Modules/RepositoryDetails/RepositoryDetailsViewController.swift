//
//  RepositoryDetailsViewController.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 08/06/2021.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {

    var repository: GithubRepoElement?
    
    init(with repo: GithubRepoElement) {
        self.repository = repo
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        debugPrint("deallocated: \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
