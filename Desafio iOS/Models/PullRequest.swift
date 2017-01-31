//
//  PullRequest.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import ObjectMapper


let kStateOpen = "open"
let kStateClosed = "closed"

struct PullRequest: Mappable {
  var user: User!
  var state: String!
  var body: String!
  var title: String!
  var createdAt: Date!
  var htmlURL: String!
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    user      <- map["user"]
    state     <- map["state"]
    body      <- map["body"]
    title     <- map["title"]
    createdAt <- (map["created_at"], DateTransform())
    htmlURL   <- map["html_url"]
  }
  
  
}


