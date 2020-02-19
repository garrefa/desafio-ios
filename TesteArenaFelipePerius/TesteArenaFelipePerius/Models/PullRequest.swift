//
//  PullRequest.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import  ObjectMapper

class PullRequest: Mappable {
    var id: Int?
    var title:String?
    var fullName:String?
    var body:String?
    var url:String?
    var user:User?
    var number:Int?
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        id <- map["id"]
        number <- map["number"]
        fullName <- map["author_association"]
        body <- map["body"]
        url <- map["html_url"]
        user <- map["user"]
    }
}
