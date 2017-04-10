//
//  RepositoryServiceMock.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation
@testable import desafio_ios

class RepositoryServiceMock: RepositoryService {
    
    var findRepositoriesExpectedResult: (repositories: [Repository], hasMorePages: Bool) = ([], false)
    var latestSearchParameters: (language: ProgrammingLanguage, sortMethod: SortMethod<RepositoriesSortKey>?, page: UInt)!
    var findRepositoriesShouldFail = false
    func findRepositories(language: ProgrammingLanguage,
                          sortBy sortMethod: SortMethod<RepositoriesSortKey>?,
                          page: UInt,
                          onCompletion completionBlock: @escaping ([Repository], Bool) -> Void,
                          onError errorBlock: @escaping (Error) -> Void) {
        latestSearchParameters = (language: language, sortMethod: sortMethod, page: page)
        if findRepositoriesShouldFail {
            errorBlock(anyError())
        } else {
            completionBlock(findRepositoriesExpectedResult.repositories, findRepositoriesExpectedResult.hasMorePages)
        }
    }
    
    var pullRequests_expectedResult: (pullRequests: [PullRequest], hasMorePages: Bool) = ([], false)
    var pullRequests_shouldFail = false
    func pullRequests(for repository: Repository,
                      filterByState state: PullRequest.State?,
                      sortBy sortMethod: SortMethod<PullRequestsSortKey>?,
                      page: UInt,
                      onCompletion completionBlock: @escaping ([PullRequest], Bool) -> Void,
                      onError errorBlock: @escaping (Error) -> Void) {
        if pullRequests_shouldFail {
            errorBlock(anyError())
        } else {
            completionBlock(pullRequests_expectedResult.pullRequests, pullRequests_expectedResult.hasMorePages)
        }
        
    }
    
    var pullRequestsCount_wasCalledForClosedPRs = false
    var pullRequestsCount_wasCalledForOpenPRs = false
    var expected_closedPRsCount = 0
    var expected_openPRsCount = 0
    var pullRequestsCount_shouldFailForClosedPRs = false
    func pullRequestsCount(for repository: Repository,
                           filterByState state: PullRequest.State?,
                           onCompletion completionBlock: @escaping (Int) -> Void,
                           onError errorBlock: @escaping (Error) -> Void) {
        if let state = state {
            switch state {
            case .closed:
                pullRequestsCount_wasCalledForClosedPRs = true
                if pullRequestsCount_shouldFailForClosedPRs {
                    errorBlock(anyError())
                } else {
                    completionBlock(expected_closedPRsCount)
                }
            case .open:
                pullRequestsCount_wasCalledForOpenPRs = true
                completionBlock(expected_openPRsCount)
            }
        }
    }
}
