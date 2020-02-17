//
//  Owner.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit
import  ObjectMapper

class Owner: Mappable {
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


