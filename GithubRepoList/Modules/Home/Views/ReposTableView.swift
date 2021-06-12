//
//  ReposTableView.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredRepositories.count
        }
        return viewModel.repositoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReposTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        var repo = viewModel.repositoriesList[indexPath.row]
        if isFiltering {
            repo = filteredRepositories[indexPath.row]
        }
        cell.configure(with: repo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var repo = viewModel.repositoriesList[indexPath.row]
        if isFiltering {
            repo = filteredRepositories[indexPath.row]
        }
        router.navigate(to: .repositoryDetails, data: repo)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = viewModel.repositoriesList.count - 1
        if indexPath.row == lastElement {
            page+=1
            print("Page: \(page)")
            addActivityIndicatorToLoadMore()
            viewModel.fetchPublicReposWithCreationDate(forPage: page, limit: limit)
        }
    }
    
    private func addActivityIndicatorToLoadMore() {
        let activityIndicatorView = UIActivityIndicatorView(style: .white)
        activityIndicatorView.frame = CGRect(origin: .zero, size: CGSize(width: 40.0, height: 40.0))
        activityIndicatorView.backgroundColor = .clear
        activityIndicatorView.color = UIColor.black
        activityIndicatorView.startAnimating()
        _view.reposTableView.tableFooterView = activityIndicatorView
    }
}

