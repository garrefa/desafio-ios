//
//  OwnerEntity.swift
//  GitHub
//
//  Created by Juliana Lacerda on 03/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import Foundation
import SwiftyJSON

class OwnerEntidy: NSObject {
    
    var ownerId: Int?
    var login: String?
    var name:String?
    
    var infoUrl: String?
    var avatarUrl: URL?
    
    init(rawData: JSON) {
        
        self.ownerId = rawData["id"].int!
        self.login = rawData["login"].string!
        
        let avatar = rawData["avatar_url"].string!
        self.avatarUrl = URL(string: avatar)
        
        self.infoUrl = rawData["url"].string!
        
        if (rawData["name"].string != nil) {
            self.name = rawData["name"].string
        }
        
    }
    
    func getFullname(callback: @escaping (OwnerEntidy) -> Void) {
        GitHubAPI.getFullNameOwner(url: self.infoUrl!) { (statusCode, result) in
            if statusCode == GitHubAPI.statusCodes.resultOk.rawValue {
                
                let owner = result[0]
                self.name = owner.name
                
                callback(self)
            }
        }
    }
    
}
