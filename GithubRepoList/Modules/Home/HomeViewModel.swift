//
//  HomeViewModel.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import Foundation

enum Status {
    case success
    case failure(error: String)
}

protocol HomeViewModelProtocol: AnyObject {
    func didFetchPublicRepos(withStatus status: Status)
    func didUpdateReposList(withStatus status: Status)
}

class HomeViewModel {
    weak var delegate: HomeViewModelProtocol?
    
    fileprivate(set) var publicRepos = GithubRepos()
    
    fileprivate(set) var repositoriesList = [GithubRepoElement]()
    
    func fetchPublicRepos(page: Int) {
        NetworkManagerImp().sendRequest(apiMethod: .getPublicRepos, completion: { [weak self] result in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let response = try GithubRepos(data: data)
                        strongSelf.publicRepos = response
                        strongSelf.delegate?.didFetchPublicRepos(withStatus: .success)
                    } catch {
                        strongSelf.delegate?.didFetchPublicRepos(withStatus: .failure(error: error.localizedDescription))
                    }
                case .failure(let error):
                    strongSelf.delegate?.didFetchPublicRepos(withStatus: .failure(error: error.localizedDescription))
                }
            }
        })
    }
    
    func fetchPublicReposWithCreationDate(forPage page: Int) {
        for i in stride(from: 0, to: page*10, by: 1) {
            if let repoName = publicRepos[i].fullName {
                NetworkManagerImp().sendRequest(apiMethod: .getRepoDetails(repoFullname: repoName), completion: { [weak self] result in
                    guard let strongSelf = self else { return }
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let data):
                            do {
                                let response = try GithubRepoElement(data: data)
                                strongSelf.repositoriesList.append(response)
                                strongSelf.delegate?.didUpdateReposList(withStatus: .success)
                            } catch {
                                strongSelf.delegate?.didFetchPublicRepos(withStatus: .failure(error: error.localizedDescription))
                            }
                        case .failure(let error):
                            strongSelf.delegate?.didFetchPublicRepos(withStatus: .failure(error: error.localizedDescription))
                        }
                    }
                })
            }
        }
    }
    
    
}
