//
//  Owner.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import ObjectMapper

struct Owner: Mappable {
  
  var login: String!
  var avatarURL: String!

  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    login     <- map["login"]
    avatarURL <- map["avatar_url"]
  }
}
