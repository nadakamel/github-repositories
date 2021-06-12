//
//  RepositoryDetailsViewController.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 08/06/2021.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {

    // MARK: Variables
    var repository: GithubRepoElement?
    let _view = RepositoryDetailsView()
    
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
    
    override func loadView() {
        super.loadView()
        _view.updateViews(withDetails: repository)
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = repository?.fullName
        view.backgroundColor = UIColor.white
    }
    

}
