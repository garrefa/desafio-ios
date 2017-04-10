//
//  Repository.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

struct Repository {
    
    let name: String
    let description: String?
    let forksCount: Int
    let stargazersCount: Int
    let owner: User
    
    init?(dictionary: [String: Any]) {
        guard
            let name = dictionary["name"] as? String,
            let forksCount = dictionary["forks_count"] as? Int,
            let stargazersCount = dictionary["stargazers_count"] as? Int,
            let ownerDict = dictionary["owner"] as? [String: Any],
            let owner = User(dictionary: ownerDict)
        else {
            debugPrint("Can't parse Repository dictionary: \(dictionary)")
            return nil
        }
        
        self.name = name
        self.description = dictionary["description"] as? String
        self.forksCount = forksCount
        self.stargazersCount = stargazersCount
        self.owner = owner
    }
}
