//
//  GithubRepoElementRealm.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 11/06/2021.
//

import RealmSwift

typealias GithubRepos = [GithubRepoElement]

class GithubRepoElementRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var nodeID = ""
    @objc dynamic var name = ""
    @objc dynamic var fullName = ""
    @objc dynamic var isPrivate = false
    @objc dynamic var owner: OwnerRealm? = nil
    @objc dynamic var htmlURL = ""
    @objc dynamic var githubRepoDescription = ""
    @objc dynamic var isForked = false
    @objc dynamic var url = ""
    @objc dynamic var forksURL = ""
    @objc dynamic var keysURL = ""
    @objc dynamic var collaboratorsURL = ""
    @objc dynamic var teamsURL = ""
    @objc dynamic var hooksURL = ""
    @objc dynamic var issueEventsURL = ""
    @objc dynamic var eventsURL = ""
    @objc dynamic var assigneesURL = ""
    @objc dynamic var branchesURL = ""
    @objc dynamic var tagsURL = ""
    @objc dynamic var blobsURL = ""
    @objc dynamic var gitTagsURL = ""
    @objc dynamic var gitRefsURL = ""
    @objc dynamic var treesURL: String?
    @objc dynamic var statusesURL = ""
    @objc dynamic var languagesURL = ""
    @objc dynamic var stargazersURL = ""
    @objc dynamic var contributorsURL = ""
    @objc dynamic var subscribersURL = ""
    @objc dynamic var subscriptionURL = ""
    @objc dynamic var commitsURL = ""
    @objc dynamic var gitCommitsURL = ""
    @objc dynamic var commentsURL = ""
    @objc dynamic var issueCommentURL = ""
    @objc dynamic var contentsURL = ""
    @objc dynamic var compareURL = ""
    @objc dynamic var mergesURL = ""
    @objc dynamic var archiveURL = ""
    @objc dynamic var downloadsURL = ""
    @objc dynamic var issuesURL = ""
    @objc dynamic var pullsURL = ""
    @objc dynamic var milestonesURL = ""
    @objc dynamic var notificationsURL = ""
    @objc dynamic var labelsURL = ""
    @objc dynamic var releasesURL = ""
    @objc dynamic var deploymentsURL = ""
    @objc dynamic var createdAt = ""
    
    
    func create(_ repo: GithubRepoElement) {
        id = repo.id
        nodeID = repo.nodeID ?? ""
        name = repo.name ?? ""
        fullName = repo.fullName ?? ""
        isPrivate = repo.isPrivate ?? false
        let ownerRealm = OwnerRealm()
        ownerRealm.create(repo.owner ?? Owner())
        owner = ownerRealm
        htmlURL = repo.htmlURL ?? ""
        githubRepoDescription = repo.githubRepoDescription ?? ""
        isForked = repo.isForked ?? false
        url = repo.url ?? ""
        forksURL = repo.forksURL ?? ""
        keysURL = repo.keysURL ?? ""
        collaboratorsURL = repo.collaboratorsURL ?? ""
        teamsURL = repo.teamsURL ?? ""
        hooksURL = repo.hooksURL ?? ""
        issueEventsURL = repo.issueEventsURL ?? ""
        eventsURL = repo.eventsURL ?? ""
        assigneesURL = repo.assigneesURL ?? ""
        branchesURL = repo.branchesURL ?? ""
        tagsURL = repo.tagsURL ?? ""
        blobsURL = repo.blobsURL ?? ""
        gitTagsURL = repo.gitTagsURL ?? ""
        gitRefsURL = repo.gitRefsURL ?? ""
        treesURL = repo.treesURL ?? ""
        statusesURL = repo.statusesURL ?? ""
        languagesURL = repo.languagesURL ?? ""
        stargazersURL = repo.stargazersURL ?? ""
        contributorsURL = repo.contributorsURL ?? ""
        subscribersURL = repo.subscribersURL ?? ""
        subscriptionURL = repo.subscriptionURL ?? ""
        commitsURL = repo.commitsURL ?? ""
        gitCommitsURL = repo.gitCommitsURL ?? ""
        commentsURL = repo.commentsURL ?? ""
        issueCommentURL = repo.issueCommentURL ?? ""
        contentsURL = repo.contentsURL ?? ""
        compareURL = repo.compareURL ?? ""
        mergesURL = repo.mergesURL ?? ""
        archiveURL = repo.archiveURL ?? ""
        downloadsURL = repo.downloadsURL ?? ""
        issuesURL = repo.issuesURL ?? ""
        pullsURL = repo.pullsURL ?? ""
        milestonesURL = repo.milestonesURL ?? ""
        notificationsURL = repo.notificationsURL ?? ""
        labelsURL = repo.labelsURL ?? ""
        releasesURL = repo.releasesURL ?? ""
        deploymentsURL = repo.deploymentsURL ?? ""
        createdAt = repo.createdAt ?? ""
    }

}
