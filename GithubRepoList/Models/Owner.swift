//
//  Owner.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 08/06/2021.
//

import Foundation
import ObjectMapper

// MARK: - Owner
final class Owner: NSObject, Mappable {
    var id: Int = 0
    var nodeID: String?
    var login: String?
    var avatarURL: String?
    var gravatarID: String?
    var url, htmlURL, followersURL: String?
    var followingURL, gistsURL, starredURL: String?
    var subscriptionsURL, organizationsURL, reposURL: String?
    var eventsURL: String?
    var receivedEventsURL: String?
    var type: String?
    var siteAdmin: Bool?

    override init() {
    }
    
    public required init?(map : Map) {
    }
    
    /// Mappable
    func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        nodeID <- map["node_id"]
        avatarURL <- map["avatar_url"]
        gravatarID <- map["gravatar_id"]
        url <- map["url"]
        htmlURL <- map["html_url"]
        followersURL <- map["followers_url"]
        followingURL <- map["following_url"]
        gistsURL <- map["gists_url"]
        starredURL <- map["starred_url"]
        subscriptionsURL <- map["subscriptions_url"]
        organizationsURL <- map["organizations_url"]
        reposURL <- map["repos_url"]
        eventsURL <- map["events_url"]
        receivedEventsURL <- map["received_events_url"]
        type <- map["type"]
        siteAdmin <- map["site_admin"]
    }
        
}
