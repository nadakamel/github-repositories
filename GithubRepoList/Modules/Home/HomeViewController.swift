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
    let _view = GithubReposView()
    var viewModel = HomeViewModel()
    
    var page: Int = 1
    
    init() {
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
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Github Repositories"
        view.backgroundColor = UIColor.white
        
        _view.reposTableView.delegate = self
        _view.reposTableView.dataSource = self
        
        viewModel.delegate = self
        viewModel.fetchPublicRepos(page: page)
    }
    
    
}

extension HomeViewController: HomeViewModelProtocol {
    func didFetchPublicRepos(withStatus status: Status) {
        switch status {
        case .success:
            viewModel.fetchPublicReposWithCreationDate(forPage: page)
        case .failure(let errorMessage):
            self.showAlertView(withTitle: "Error", andMessage: errorMessage, shouldDismissView: false)
        }
    }
    
    func didUpdateReposList(withStatus status: Status) {
        _view.spinner.stopAnimating()
        switch status {
        case .success:
            _view.reposTableView.backgroundView = nil
        case .failure(let errorMessage):
            _view.emptyTableViewLabel.text = errorMessage
            _view.reposTableView.backgroundView = _view.emptyTableViewLabel
            self.showAlertView(withTitle: "Error", andMessage: errorMessage, shouldDismissView: false)
        }
        _view.reposTableView.reloadData()
    }
}
