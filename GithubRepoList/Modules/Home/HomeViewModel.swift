//
//  HomeViewModel.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import Foundation
import ObjectMapper

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
    
    fileprivate(set) var repositoriesList = GithubRepos()
    
    func fetchPublicRepos() {
        NetworkManagerImp().sendRequest(apiMethod: .getPublicRepos, completion: { [weak self] result in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSArray
                        print(responseJSON)
                        guard let repositories = Mapper<GithubRepoElement>().mapArray(JSONObject: responseJSON) else {
                            print("*********** Repositories Data Not Found! ***********")
                            break
                        }
                        // Save repos locally using realm
                        RealmHelper.saveGithubReposToRealm(repos: repositories)
                        // Notify view
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
    
    func fetchPublicReposWithCreationDate(forPage page: Int, limit: Int) {
        let publicRepos = RealmHelper.getRealmGithubRepos() ?? []
        var startIndex = 0
        if(page > 1) {
            startIndex+=(page*limit)
        }
        if publicRepos.count > startIndex+limit {
            for i in stride(from: startIndex, to: startIndex+limit, by: 1) {
                if let repoName = publicRepos[i].fullName {
                    NetworkManagerImp().sendRequest(apiMethod: .getRepoDetails(repoFullname: repoName), completion: { [weak self] result in
                        guard let strongSelf = self else { return }
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let data):
                                do {
                                    let responseJSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
                                    print(responseJSON)
                                    guard let repository = Mapper<GithubRepoElement>().map(JSONObject: responseJSON) else {
                                        print("*********** Repository Data Not Found! ***********")
                                        break
                                    }
                                    strongSelf.repositoriesList.append(repository)
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
    
    
}
