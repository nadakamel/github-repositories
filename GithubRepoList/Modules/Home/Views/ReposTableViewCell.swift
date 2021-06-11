//
//  ReposTableViewCell.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import UIKit

class ReposTableViewCell: UITableViewCell {
    
    fileprivate lazy var ownerImageView: UIImageView = {
        let ownerImageView = UIImageView()
        ownerImageView.translatesAutoresizingMaskIntoConstraints = false
        ownerImageView.layer.cornerRadius = 30
        ownerImageView.layer.masksToBounds = true
        ownerImageView.contentMode = .scaleToFill
        ownerImageView.clipsToBounds = true
        return ownerImageView
    }()
    
    fileprivate lazy var ownerNameLabel: UILabel = {
        let ownerNameLabel = UILabel()
        ownerNameLabel.numberOfLines = 0
        ownerNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        ownerNameLabel.textColor = .black
        ownerNameLabel.lineBreakMode = .byWordWrapping
        ownerNameLabel.backgroundColor = .clear
        ownerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return ownerNameLabel
    }()
    
    fileprivate lazy var repoNameLabel: UILabel = {
        let repoNameLabel = UILabel()
        repoNameLabel.numberOfLines = 0
        repoNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        repoNameLabel.textColor = .black
        repoNameLabel.lineBreakMode = .byWordWrapping
        repoNameLabel.backgroundColor = .clear
        repoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return repoNameLabel
    }()
    
    fileprivate lazy var creationDateLabel: UILabel = {
        let creationDateLabel = UILabel()
        creationDateLabel.numberOfLines = 0
        creationDateLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        creationDateLabel.textColor = .black
        creationDateLabel.lineBreakMode = .byWordWrapping
        creationDateLabel.backgroundColor = .clear
        creationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        return creationDateLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ownerImageView.image = nil
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            ownerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            ownerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ownerImageView.heightAnchor.constraint(equalToConstant: 60),
            ownerImageView.widthAnchor.constraint(equalToConstant: 60),
            
            ownerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            ownerNameLabel.leadingAnchor.constraint(equalTo: ownerImageView.trailingAnchor, constant: 8),
            ownerNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            ownerNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
            
            repoNameLabel.topAnchor.constraint(equalTo: ownerNameLabel.bottomAnchor, constant: 5),
            repoNameLabel.leadingAnchor.constraint(equalTo: ownerImageView.trailingAnchor, constant: 8),
            repoNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            repoNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
            
            creationDateLabel.topAnchor.constraint(equalTo: repoNameLabel.bottomAnchor, constant: 5),
            creationDateLabel.leadingAnchor.constraint(equalTo: ownerImageView.trailingAnchor, constant: 8),
            creationDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            creationDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),
            creationDateLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1)
        ])
    }
    
    fileprivate func setupViews() {
        ownerImageView.frame.size = CGSize(width: 60, height: 60)
        ownerImageView.backgroundColor = .lightGray
        contentView.addSubview(ownerImageView)
        contentView.addSubview(ownerNameLabel)
        contentView.addSubview(repoNameLabel)
        contentView.addSubview(creationDateLabel)
        setupConstraints()
    }
    
    func configure(with repo: GithubRepoElement) {
        if let avatarURL = repo.owner?.avatarURL {
            ownerImageView.downloadImage(from: avatarURL)
        }
        ownerNameLabel.text = "\(repo.owner?.login ?? "") created a public repository"
        repoNameLabel.text = repo.fullName
        creationDateLabel.text = repo.createdAt?.toDate()?.toFormattedString()
    }
    
    
}
