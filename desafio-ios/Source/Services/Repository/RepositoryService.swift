//
//  RepositoryService.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

protocol RepositoryService {
    
    /// Fetches the n-th page of repositories for a given language, sorted by a given mehod.
    ///
    /// - Parameters:
    /// 	- language: The main programming language of the repository
    /// 	- sortMethod: An optional method to sort the results
    ///		- page: the offset from the beginning of the result set
    ///		- completionBlock: a closure that's called when the search succeeds, passing the repositories found and a
    ///         bool value indicating if there are more pages of results to be fetched
    /// 	- errorBlock: a closure that's called when the search fails, passing an error object
    func findRepositories(language: ProgrammingLanguage,
                          sortBy sortMethod: SortMethod?,
                          page: UInt,
                          onCompletion completionBlock: ([Repository], Bool) -> Void,
                          onError errorBlock: (Error) -> Void)
}
