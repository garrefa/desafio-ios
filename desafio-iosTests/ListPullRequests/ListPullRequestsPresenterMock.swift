//
//  ListPullRequestsPresenterMock.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 09/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation
@testable import desafio_ios

class ListPullRequestsPresenterMock: ListPullRequestsPresenter {

    var latestPullRequestsCountResult: PullRequestsCountResult?
    func presentPullRequestsCount(_ count: PullRequestsCountResult) {
        latestPullRequestsCountResult = count
    }
    
    var latest_presentPullRequests_result: (pullRequests: [PullRequest], shouldAppend: Bool, hasMore: Bool)?
    func presentPullRequests(_ pullRequests: [PullRequest], shouldAppend: Bool, hasMore: Bool) {
        latest_presentPullRequests_result = (pullRequests: pullRequests, shouldAppend: shouldAppend, hasMore: hasMore)
    }
    
    var latestRequestError: Error?
    func presentRequestError(_ error: Error) {
        latestRequestError = error
    }
}
