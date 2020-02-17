//
//  RepositoryPullRequests.swift
//  APIKit
//
//  Created by Bruno Wide on 16/02/20.
//  Copyright © 2020 BWide. All rights reserved.
//

import Foundation
import Alamofire

struct RepositoryPullRequestsRequest: Request {
    typealias ReturnType = [PullRequest]
    
    var body: [String : String]?
    let path: String
    var method: HTTPMethod = .get
    
    init(owner: String, name: String) {
        path = "/repos/\(owner)/\(name)/pulls"
    }
}
