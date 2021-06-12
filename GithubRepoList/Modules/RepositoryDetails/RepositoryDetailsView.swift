//
//  RepositoryDetailsView.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 12/06/2021.
//

import UIKit

class RepositoryDetailsView: UIView {
    
    lazy var urlTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .blue
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.text = "Repository URL"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var urlTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .blue
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.text = "Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var watchersStargazersForksTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .blue
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.text = "Watchers\t\tStars\t\tForks"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var watchersStargazersForksTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var defaultBranchTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .blue
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.text = "Default Branch"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var defaultBranchTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var openIssuesTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .blue
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.text = "Number of Open Issues: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var openIssuesTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupViewsConstraints() {
        NSLayoutConstraint.activate([
            urlTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            urlTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            urlTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            urlTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
        NSLayoutConstraint.activate([
            urlTextLabel.topAnchor.constraint(equalTo: urlTitleLabel.bottomAnchor, constant: 5),
            urlTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            urlTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            urlTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
        NSLayoutConstraint.activate([
            descriptionTitleLabel.topAnchor.constraint(equalTo: urlTextLabel.bottomAnchor, constant: 20),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            descriptionTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
        NSLayoutConstraint.activate([
            descriptionTextLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 5),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            descriptionTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
        NSLayoutConstraint.activate([
            watchersStargazersForksTitleLabel.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 20),
            watchersStargazersForksTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            watchersStargazersForksTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            watchersStargazersForksTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
        NSLayoutConstraint.activate([
            watchersStargazersForksTextLabel.topAnchor.constraint(equalTo: watchersStargazersForksTitleLabel.bottomAnchor, constant: 5),
            watchersStargazersForksTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            watchersStargazersForksTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            watchersStargazersForksTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
        NSLayoutConstraint.activate([
            defaultBranchTitleLabel.topAnchor.constraint(equalTo: watchersStargazersForksTextLabel.bottomAnchor, constant: 20),
            defaultBranchTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            defaultBranchTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            defaultBranchTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
        NSLayoutConstraint.activate([
            defaultBranchTextLabel.topAnchor.constraint(equalTo: defaultBranchTitleLabel.bottomAnchor, constant: 5),
            defaultBranchTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            defaultBranchTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            defaultBranchTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
        NSLayoutConstraint.activate([
            openIssuesTitleLabel.topAnchor.constraint(equalTo: defaultBranchTextLabel.bottomAnchor, constant: 20),
            openIssuesTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            openIssuesTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
        NSLayoutConstraint.activate([
            openIssuesTextLabel.topAnchor.constraint(equalTo: defaultBranchTextLabel.bottomAnchor, constant: 22),
            openIssuesTextLabel.leadingAnchor.constraint(equalTo: openIssuesTitleLabel.trailingAnchor, constant: 15),
            openIssuesTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            openIssuesTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
    }
    
    private func setupUI() {
        [urlTitleLabel, urlTextLabel, descriptionTitleLabel, descriptionTextLabel,
         watchersStargazersForksTitleLabel, watchersStargazersForksTextLabel,
         defaultBranchTitleLabel, defaultBranchTextLabel, openIssuesTitleLabel, openIssuesTextLabel].forEach {
            self.addSubview($0)
        }
        setupViewsConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateViews(withDetails repo: GithubRepoElement?) {
        urlTextLabel.text = repo?.htmlURL
        descriptionTextLabel.text = repo?.githubRepoDescription
        watchersStargazersForksTextLabel.text = "\(repo?.watchersCount ?? 0)\t\t\t\t\(repo?.stargazersCount ?? 0)\t\t\t\t\(repo?.forksCount ?? 0)"
        defaultBranchTextLabel.text = "\(repo?.defaultBranch ?? "")"
        openIssuesTextLabel.text = "\(repo?.openIssuesCount ?? 0)"
    }
    
    
}
