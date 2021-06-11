//
//  GithubReposView.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import UIKit

class GithubReposView: UIView {
    
    var reposTableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = 15
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var emptyTableViewLabel: UILabel = {
        let label = UILabel(frame: reposTableView.frame)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = UIColor.darkGray
        label.text = "No repositories found"
        return label
    }()
    
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupViewsConstraints() {
        NSLayoutConstraint.activate([
            reposTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            reposTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            reposTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            reposTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupUI() {
        self.addSubview(reposTableView)
        setupViewsConstraints()
    }
    
    private func setupTableView() {
        reposTableView.register(ReposTableViewCell.self)
    }
    
    private func setupSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        reposTableView.backgroundView = spinner
        
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTableView()
        setupSpinner()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
