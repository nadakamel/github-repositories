//
//  OwnerRealm.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 12/06/2021.
//

import RealmSwift

class OwnerRealm: Object {
 
    @objc dynamic var id = 0
    @objc dynamic var nodeID = ""
    @objc dynamic var login = ""
    @objc dynamic var avatarURL = ""
    @objc dynamic var gravatarID = ""
    @objc dynamic var url = ""
    @objc dynamic var htmlURL = ""
    @objc dynamic var followersURL = ""
    @objc dynamic var followingURL = ""
    @objc dynamic var gistsURL = ""
    @objc dynamic var starredURL = ""
    @objc dynamic var subscriptionsURL = ""
    @objc dynamic var organizationsURL = ""
    @objc dynamic var reposURL = ""
    @objc dynamic var eventsURL = ""
    @objc dynamic var receivedEventsURL = ""
    @objc dynamic var type = ""
    @objc dynamic var siteAdmin = false

    func create(_ owner: Owner) {
        id = owner.id
        nodeID = owner.nodeID ?? ""
        login = owner.login ?? ""
        avatarURL = owner.avatarURL ?? ""
        gravatarID = owner.gravatarID ?? ""
        url = owner.url ?? ""
        htmlURL = owner.htmlURL ?? ""
        followersURL = owner.followersURL ?? ""
        followingURL = owner.followingURL ?? ""
        gistsURL = owner.gistsURL ?? ""
        starredURL = owner.starredURL ?? ""
        subscriptionsURL = owner.subscriptionsURL ?? ""
        organizationsURL = owner.organizationsURL ?? ""
        reposURL = owner.reposURL ?? ""
        eventsURL = owner.eventsURL ?? ""
        receivedEventsURL = owner.receivedEventsURL ?? ""
        type = owner.type ?? ""
        siteAdmin = owner.siteAdmin ?? false
    }
    
}
