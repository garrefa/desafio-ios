//
//  GithubRepositoryService.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

/// A class that implements RepositoryService, fetching data from the Github API
class GithubRepositoryService: RepositoryService {

    func findRepositories(language: ProgrammingLanguage,
                          sortBy sortMethod: SortMethod?,
                          page: UInt,
                          onCompletion completionBlock: ([Repository], Bool) -> Void,
                          onError errorBlock: (Error) -> Void) {
        // TODO: implement this
        completionBlock([], false)
    }
}
