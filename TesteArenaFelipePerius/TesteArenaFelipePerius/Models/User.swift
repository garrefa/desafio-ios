//
//  User.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit
import  ObjectMapper

class User: Mappable {
    var id: Int?
    var avatarUrl:String?
    var error : String?
    var name:String?
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        avatarUrl <- map["avatar_url"]
        name <- map["login"]
        error <- map["error"]
    }
}
