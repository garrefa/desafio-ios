//
//  User.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 09/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

struct User {
    
    let login: String
    let avatarURL: URL?
    
    init?(dictionary: [String: Any]) {
        guard let login = dictionary["login"] as? String else {
            debugPrint("can't parse User dictionary: \(dictionary)")
            return nil
        }
        self.login = login
        
        if let avatarURLString = dictionary["avatar_url"] as? String, let avatarURL = URL(string: avatarURLString) {
            self.avatarURL = avatarURL
        } else {
            self.avatarURL = nil
        }
    }
}
