//
//  UserRequest.swift
//  APIKit
//
//  Created by Bruno Wide on 16/02/20.
//  Copyright © 2020 BWide. All rights reserved.
//

import Foundation
import Alamofire

class UserRequest: Request {
    typealias ReturnType = User
    
    var body: [String : String]?
    let path: String
    var method: HTTPMethod = .get
    
    init(userLight: UserLight) {
        path = "/users/\(userLight.login ?? "")"
    }
}
