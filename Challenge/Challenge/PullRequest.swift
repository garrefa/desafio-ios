//
//  PullRequest.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit
import ObjectMapper

class PullRequest: NSObject, Mappable {

    var title: String!
    var body: String!
    var user: Owner!
    var html_url: String!
    var create_at : String!
    
    func mapping(map: Map) {
        title <- map["title"]
        body <- map["body"]
        user <- map["user"]
        html_url <- map["html_url"]
        create_at <- map["created_at"]
    }
    
    override init() {
        super.init()
        self.title = ""
        self.body = ""
        self.create_at = ""
        self.user = Owner()
        self.html_url = ""
    }

    init(title: String, body: String,created: String, user: Owner, html_url: String) {
        self.title = title
        self.body = body
        self.user = user
        self.create_at = created
        self.html_url = html_url
    }
    
    required init?(map: Map) {}
    
    
}
