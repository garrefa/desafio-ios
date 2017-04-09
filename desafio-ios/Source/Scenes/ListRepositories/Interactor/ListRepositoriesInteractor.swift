//
//  ListRepositoriesInteractor.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright (c) 2017 Stationfy. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation

/// Interface provided by a ListRepositoriesInteractor to receive events from a ViewController
protocol ListRepositoriesInteractor {

    var repositories: [Repository] { get }
    
    /// loads the the first page of repositories
    func reloadRepositories()
    
    /// loads the next page of repositories
    func loadMoreRepositories()
}
