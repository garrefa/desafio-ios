//
//  Repository.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import ObjectMapper

struct Repository: Mappable {
  var repositoryId: Int!;
  var name: String!
  var fullname: String!
  var respositoryDescription: String!
  var forksCount: Int! = 0
  var stargazersCount: Int! = 0
  var owner: Owner!
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    repositoryId           <- map["id"]
    name                   <- map["name"]
    fullname               <- map["full_name"]
    respositoryDescription <- map["description"]
    forksCount             <- map["forks"]
    stargazersCount        <- map["stargazers_count"]
    owner                  <- map["owner"]
  }
}
