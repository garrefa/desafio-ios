//
//  ListPullRequestsInteractor.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 09/04/17.
//  Copyright (c) 2017 Stationfy. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation

/// Interface provided by a ListPullRequestsInteractor to receive events from a ViewController
protocol ListPullRequestsInteractor {

    var repository: Repository! { get set } // the repository for which we'll retrieve the pull requests
    
    var pullRequests: [PullRequest] { get }
    
    /// loads the first page of pull requests
    func reloadPullRequests()
    
    /// loads the next page of pull requests
    func loadMorePullRequests()
}
