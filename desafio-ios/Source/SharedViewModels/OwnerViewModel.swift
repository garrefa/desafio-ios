//
//  OwnerViewModel.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

struct OwnerViewModel {
    let profilePictureURL: URL?
    let userName: String
    let displayName: String
    
    init(owner: Owner) {
        profilePictureURL = owner.avatarURL
        userName = owner.login
        displayName = "" // TODO: fetch owner name in the API
    }
}
