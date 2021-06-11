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
    @objc dynamic var nodeID: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var fullName: String = ""
    @objc dynamic var isPrivate: Bool = false
    @objc dynamic var owner = Owner()
    @objc dynamic var htmlURL: String = ""
    @objc dynamic var githubRepoDescription: String = ""
    @objc dynamic var isForked: Bool = false
    @objc dynamic var url: String = ""
    @objc dynamic var forksURL: String = ""
    @objc dynamic var keysURL: String = ""
    @objc dynamic var collaboratorsURL: String = ""
    @objc dynamic var teamsURL: String = ""
    @objc dynamic var hooksURL: String = ""
    @objc dynamic var issueEventsURL: String = ""
    @objc dynamic var eventsURL: String = ""
    @objc dynamic var assigneesURL: String = ""
    @objc dynamic var branchesURL: String = ""
    @objc dynamic var tagsURL: String = ""
    @objc dynamic var blobsURL: String = ""
    @objc dynamic var gitTagsURL: String = ""
    @objc dynamic var gitRefsURL: String = ""
    @objc dynamic var treesURL: String?
    @objc dynamic var statusesURL: String = ""
    @objc dynamic var languagesURL: String = ""
    @objc dynamic var stargazersURL: String = ""
    @objc dynamic var contributorsURL: String = ""
    @objc dynamic var subscribersURL: String = ""
    @objc dynamic var subscriptionURL: String = ""
    @objc dynamic var commitsURL: String = ""
    @objc dynamic var gitCommitsURL: String = ""
    @objc dynamic var commentsURL: String = ""
    @objc dynamic var issueCommentURL: String = ""
    @objc dynamic var contentsURL: String = ""
    @objc dynamic var compareURL: String = ""
    @objc dynamic var mergesURL: String = ""
    @objc dynamic var archiveURL: String = ""
    @objc dynamic var downloadsURL: String = ""
    @objc dynamic var issuesURL: String = ""
    @objc dynamic var pullsURL: String = ""
    @objc dynamic var milestonesURL: String = ""
    @objc dynamic var notificationsURL: String = ""
    @objc dynamic var labelsURL: String = ""
    @objc dynamic var releasesURL: String = ""
    @objc dynamic var deploymentsURL: String = ""
    @objc dynamic var createdAt: String = ""
    
    
    func create(_ repo: GithubRepoElement) {
        id = repo.id
        nodeID = repo.nodeID ?? ""
        name = repo.name ?? ""
        fullName = repo.fullName ?? ""
        isPrivate = repo.isPrivate ?? false
        owner = repo.owner ?? Owner()
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
