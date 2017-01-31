//
//  ArrayContainsExtension.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Souza. All rights reserved.
//

import Foundation
import ObjectMapper

extension Array {
  func contains<T>(obj: T) -> Bool where T : Equatable {
    return self.filter({$0 as? T == obj}).count > 0
  }
  
  func arrayOfClass<T: Mappable>() -> [T] {
    var newArray = [T]()
    for value in self {
      if let object = value as? [String : Any] {
        if let parsedItem = Mapper<T>().map(JSON: object) {
          newArray.append(parsedItem)
        }
      }
    }
   
    return newArray
  }
}
