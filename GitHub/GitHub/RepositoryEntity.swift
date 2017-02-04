//
//  RepositoryEntity.swift
//  GitHub
//
//  Created by Juliana Lacerda on 03/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import Foundation
import SwiftyJSON

class RepositoryEntity: NSObject {
    
    var repositoryId: Int?
    var name: String?
    var descript: String?
    var forksNum: Int?
    var startsNum: Int?
    var owner: OwnerEntidy?
    
    var pullsUrl: String?
    
    init(rawData: JSON) {
        
        self.repositoryId = rawData["id"].int!
        self.name = rawData["name"].string
        
        self.descript = rawData["description"].string
        
        self.forksNum = rawData["forks_count"].int
        self.startsNum = rawData["stargazers_count"].int
        
        self.owner = OwnerEntidy(rawData: rawData["owner"])
        
        //get url and adjust html for get all pulls
        let url = rawData["pulls_url"].string!
        self.pullsUrl = url.replacingOccurrences(of: "{/number}", with: "?state=all")
        
    }
    
    
    
}
