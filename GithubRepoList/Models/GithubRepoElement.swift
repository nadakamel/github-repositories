//
//  GithubRepoElement.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 08/06/2021.
//

import Foundation
import ObjectMapper

final class GithubRepoElement: NSObject, Mappable {
    var id: Int = 0
    var nodeID, name, fullName: String?
    var isPrivate: Bool?
    var owner: Owner?
    var htmlURL: String?
    var githubRepoDescription: String?
    var isForked: Bool?
    var url, forksURL: String?
    var keysURL, collaboratorsURL: String?
    var teamsURL, hooksURL: String?
    var issueEventsURL: String?
    var eventsURL: String?
    var assigneesURL, branchesURL: String?
    var tagsURL: String?
    var blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    var statusesURL: String?
    var languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    var subscriptionURL: String?
    var commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    var contentsURL, compareURL: String?
    var mergesURL: String?
    var archiveURL: String?
    var downloadsURL: String?
    var issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    var labelsURL, releasesURL: String?
    var deploymentsURL: String?
    var createdAt: String?
    
    override init() {
    }
    
    public required init?(map : Map) {
    }
    
    /// Mappable
    func mapping(map: Map) {
        id <- map["id"]
        nodeID <- map["node_id"]
        name <- map["name"]
        fullName <- map["full_name"]
        isPrivate <- map["private"]
        owner <- map["owner"]
        htmlURL <- map["html_url"]
        githubRepoDescription <- map["description"]
        isForked <- map["fork"]
        url <- map["url"]
        forksURL <- map["forks_url"]
        keysURL <- map["keys_url"]
        collaboratorsURL <- map["collaborators_url"]
        teamsURL <- map["teams_url"]
        hooksURL <- map["hooks_url"]
        issueEventsURL <- map["issue_events_url"]
        eventsURL <- map["events_url"]
        assigneesURL <- map["assignees_url"]
        branchesURL <- map["branches_url"]
        tagsURL <- map["tags_url"]
        blobsURL <- map["blobs_url"]
        gitTagsURL <- map["git_tags_url"]
        gitRefsURL <- map["git_refs_url"]
        treesURL <- map["trees_url"]
        statusesURL <- map["statuses_url"]
        languagesURL <- map["languages_url"]
        stargazersURL <- map["stargazers_url"]
        contributorsURL <- map["contributors_url"]
        subscribersURL <- map["subscribers_url"]
        subscriptionURL <- map["subscription_url"]
        commitsURL <- map["commits_url"]
        gitCommitsURL <- map["git_commits_url"]
        commentsURL <- map["comments_url"]
        issueCommentURL <- map["issue_comment_url"]
        contentsURL <- map["contents_url"]
        compareURL <- map["compare_url"]
        mergesURL <- map["merges_url"]
        archiveURL <- map["archive_url"]
        downloadsURL <- map["downloads_url"]
        issuesURL <- map["issues_url"]
        pullsURL <- map["pulls_url"]
        milestonesURL <- map["milestones_url"]
        notificationsURL <- map["notifications_url"]
        labelsURL <- map["labels_url"]
        releasesURL <- map["releases_url"]
        deploymentsURL <- map["deployments_url"]
        createdAt <- map["created_at"]
    }
    
    /// Realm
    func initWithRealm(realm : GithubRepoElementRealm) {
        id = realm.id
        nodeID = realm.nodeID
        name = realm.name
        fullName = realm.fullName
        isPrivate = realm.isPrivate
        let repoOwner = Owner()
        repoOwner.initWithRealm(realm: realm.owner ?? OwnerRealm())
        owner = repoOwner
        htmlURL = realm.htmlURL
        githubRepoDescription = realm.githubRepoDescription
        isForked = realm.isForked
        url = realm.url
        forksURL = realm.forksURL
        keysURL = realm.keysURL
        collaboratorsURL = realm.collaboratorsURL
        teamsURL = realm.teamsURL
        hooksURL = realm.hooksURL
        issueEventsURL = realm.issueEventsURL
        eventsURL = realm.eventsURL
        assigneesURL = realm.assigneesURL
        branchesURL = realm.branchesURL
        tagsURL = realm.tagsURL
        blobsURL = realm.blobsURL
        gitTagsURL = realm.gitTagsURL
        gitRefsURL = realm.gitRefsURL
        treesURL = realm.treesURL
        statusesURL = realm.statusesURL
        languagesURL = realm.languagesURL
        stargazersURL = realm.stargazersURL
        contributorsURL = realm.contributorsURL
        subscribersURL = realm.subscribersURL
        subscriptionURL = realm.subscriptionURL
        commitsURL = realm.commitsURL
        gitCommitsURL = realm.gitCommitsURL
        commentsURL = realm.commentsURL
        issueCommentURL = realm.issueCommentURL
        contentsURL = realm.contentsURL
        compareURL = realm.compareURL
        mergesURL = realm.mergesURL
        archiveURL = realm.archiveURL
        downloadsURL = realm.downloadsURL
        issuesURL = realm.issuesURL
        pullsURL = realm.pullsURL
        milestonesURL = realm.milestonesURL
        notificationsURL = realm.notificationsURL
        labelsURL = realm.labelsURL
        releasesURL = realm.releasesURL
        deploymentsURL = realm.deploymentsURL
        createdAt = realm.createdAt
    }

}
