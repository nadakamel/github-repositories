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
    let limit: Int = 10
    
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var filteredRepositories: GithubRepos = []
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
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

    fileprivate func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Github Repositories"
        router = DefaultHomeRouter(viewController: self)
        view.backgroundColor = UIColor.white
        
        configureSearchController()
        
        _view.reposTableView.delegate = self
        _view.reposTableView.dataSource = self
        
        viewModel.delegate = self
        
        let repos = RealmHelper.getRealmGithubRepos() ?? []
        if (repos.isEmpty) {
            viewModel.fetchPublicRepos()
        } else {
            viewModel.fetchPublicReposWithCreationDate(forPage: page, limit: limit)
        }
    }
    
    fileprivate func filterContentForSearchText(_ searchText: String, category: GithubRepoElement? = nil) {
        filteredRepositories = viewModel.repositoriesList.filter { (repo: GithubRepoElement) -> Bool in
            return repo.fullName?.lowercased().contains(searchText.lowercased()) ?? false
        }
        _view.reposTableView.reloadData()
    }

    
}

extension HomeViewController: HomeViewModelProtocol {
    func didFetchPublicRepos(withStatus status: Status) {
        switch status {
        case .success:
            viewModel.fetchPublicReposWithCreationDate(forPage: page, limit: limit)
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
        _view.reposTableView.tableFooterView = nil
        _view.reposTableView.reloadData()
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
