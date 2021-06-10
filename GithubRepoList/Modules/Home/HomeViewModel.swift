//
//  HomeViewModel.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import Foundation

class HomeViewModel {
    
    func fetchPublicRepos(completion: @escaping CompletionHandler) {
        NetworkManagerImp().sendRequest(apiMethod: .getPublicRepos) { data, error in
            if error != nil {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            } else {
                do {
                    let response = try GithubRepos(data: data as! Data)
                    DispatchQueue.main.async {
                        completion(response, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error.localizedDescription)
                    }
                }
            }
        }
    }
}
