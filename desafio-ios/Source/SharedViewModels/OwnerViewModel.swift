//
//  UserViewModel.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

struct UserViewModel {
    let profilePictureURL: URL?
    let userName: String
    let displayName: String
    
    init(user: User) {
        profilePictureURL = user.avatarURL
        userName = user.login
        displayName = "" // TODO: fetch owner name in the API
    }
}
