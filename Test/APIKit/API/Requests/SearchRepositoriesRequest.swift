//
//  EventRequests.swift
//  Test
//
//  Created by Bruno Wide on 23/12/19.
//  Copyright © 2019 BWide. All rights reserved.
//

import Foundation
import Alamofire

struct SearchRepositoriesRequest: Request {
    typealias ReturnType = RepositoriesResponse
    
    var body: [String : String]?
    let path = "/search/repositories"
    var method: HTTPMethod = .get
    
    init(query: String?, sort: Sort?, order: Order, page: String) {
        var body: [String: String] = [:]
        
        if let query = query { body["q"] = query }
        if let sort = sort {
            body["sort"] = sort.rawValue
            body["order"] = order.rawValue
        }
        
        body["page"] = page
        
        self.body = body
    }
}
