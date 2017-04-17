//
//  Owner.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit
import ObjectMapper

class Owner: NSObject, Mappable {

    var login: String!
    var avatarPhotoUrl: String!
    
    func mapping(map: Map) {
        login <- map["login"]
        avatarPhotoUrl <- map["avatar_url"]
    }
    
    override init(){
        super.init()
        self.login = ""
        self.avatarPhotoUrl = ""
    }
    
    init(login: String, photo: String) {
        self.login = login
        self.avatarPhotoUrl = photo
    }
    
    required init?(map: Map) {}
    
}
