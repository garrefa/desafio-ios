//
//  RepositoryService.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

enum RepositoryServiceError: Error {
    case notConnected
    case unableToParseResponse
    case unableToParseHeaders
}

protocol RepositoryService {
    
    /// Fetches the n-th page of repositories for a given language.
    ///
    /// - Parameters:
    /// 	- language: The main programming language of the repository
    /// 	- sortMethod: An optional method to sort the results
    ///		- page: the offset from the beginning of the result set
    ///		- completionBlock: a closure that's called when the search succeeds, passing the repositories found and a
    ///         bool value indicating if there are more pages of results to be fetched
    /// 	- errorBlock: a closure that's called when the search fails, passing an error object
    func findRepositories(language: ProgrammingLanguage,
                          sortBy sortMethod: SortMethod<RepositoriesSortKey>?,
                          page: UInt,
                          onCompletion completionBlock: @escaping ([Repository], Bool) -> Void,
                          onError errorBlock: @escaping (Error) -> Void)
    
    /// Fetches the n-th page of pull requests for a given repository.
    ///
    /// - Parameters:
    /// 	- repository: The repository for which we want to fetch the pull requests
    ///     - state: A filter to be applied based on the pull requests' state
    /// 	- sortMethod: An optional method to sort the results
    ///		- page: the offset from the beginning of the result set
    ///		- completionBlock: a closure that's called when the search succeeds, passing the pull requests found and a
    ///         bool value indicating if there are more pages of results to be fetched
    /// 	- errorBlock: a closure that's called when the search fails, passing an error object
    func pullRequests(for repository: Repository,
                      filterBy state: PullRequestsStateFilter,
                      sortBy sortMethod: SortMethod<PullRequestsSortKey>?,
                      page: UInt,
                      onCompletion completionBlock: @escaping ([PullRequest], Bool) -> Void,
                      onError errorBlock: @escaping (Error) -> Void)
}
