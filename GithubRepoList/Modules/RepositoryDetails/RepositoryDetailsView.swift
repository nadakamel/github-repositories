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
            urlTextLabel.topAnchor.constraint(equalTo: urlTitleLabel.bottomAnchor, constant: 8),
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
            descriptionTextLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 8),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            descriptionTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
    }
    
    private func setupUI() {
        [urlTitleLabel, urlTextLabel, descriptionTitleLabel, descriptionTextLabel].forEach {
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
    }
    
    
}

