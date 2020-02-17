//
//  ListRepositories.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit
import  ObjectMapper

class RepositoryList: Mappable {
    var repositoryList : [Repository]?
    var error : String?
    var totalCount:Int?
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        repositoryList <- map["items"]
        totalCount <- map["total_count"]
        error <- map["error"]
    }
}
