//
//  RealmHelper.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 11/06/2021.
//

import Foundation

class RealmHelper: NSObject {
    static func saveGithubReposToRealm(repos: GithubRepos) {
        for repo in repos {
            let repoRealm = GithubRepoElementRealm()
            repoRealm.create(repo)
            RealmManager.sharedInstance.add([repoRealm])
        }
    }

    static func getRealmGithubRepos() -> GithubRepos? {
        let reposRealm = RealmManager.sharedInstance.getAllDataForObject(GithubRepoElementRealm.self).map{$0 as! GithubRepoElementRealm}
        if reposRealm.count > 0 {
            var repos = GithubRepos()
            for repoRealm in reposRealm {
                let repo = GithubRepoElement()
                repo.initWithRealm(realm: repoRealm)
                repos.append(repo)
            }
            return repos
        }
        return nil
    }

}
