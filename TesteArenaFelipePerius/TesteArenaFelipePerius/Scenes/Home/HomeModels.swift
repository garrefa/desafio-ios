//
//  HomeModels.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit


enum HomeModel {
    struct Request {
    
    }
    
    struct Response {
        var repositoryList: RepositoryList?
        var isError: Bool
        var messageError: String?
    }
}
