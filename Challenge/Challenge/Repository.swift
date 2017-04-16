//
//  Repository.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit
import ObjectMapper

class Repository: NSObject, Mappable {

    var owner: Owner!
    var name: String!
    var descript: String?
    var fullName: String!
    var forks_count: Int!
    var stars_count: Int!
    
    func mapping(map: Map) {
        owner <- map["owner"]
        name <- map["name"]
        fullName <- map["full_name"]
        forks_count <- map["forks_count"]
        stars_count <- map["stargazers_count"]
        descript <- map["description"]
    }

    override init() {
        super.init()
        self.owner = Owner()
        self.name = ""
        self.descript = ""
        self.fullName = ""
        self.forks_count = 0
        self.stars_count = 0
    }
    
    init(owner: Owner, name: String, descript: String, fullName: String, forks: Int, stars: Int) {
        self.owner = owner
        self.name = name
        self.descript = descript
        self.fullName = fullName
        self.forks_count = forks
        self.stars_count = stars
    }
    
    required init?(map:Map) {}
    
    
}
