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
    
    func pullRequests(for repository: Repository,
                      filterByState state: PullRequest.State?,
                      sortBy sortMethod: SortMethod<PullRequestsSortKey>?,
                      page: UInt,
                      onCompletion completionBlock: @escaping ([PullRequest], Bool) -> Void,
                      onError errorBlock: @escaping (Error) -> Void) {
    }
    
    func pullRequestsCount(for repository: Repository,
                           filterByState state: PullRequest.State?,
                           onCompletion completionBlock: @escaping (Int) -> Void,
                           onError errorBlock: @escaping (Error) -> Void) {
    }
}
