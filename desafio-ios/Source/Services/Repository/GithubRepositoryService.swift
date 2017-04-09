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
                          onCompletion completionBlock: @escaping ([Repository], Bool) -> Void,
                          onError errorBlock: @escaping (Error) -> Void) {
        // TODO: implement this
        //sleep(2)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            completionBlock([Repository(),Repository(),Repository(),Repository(),Repository(),Repository(),Repository()], page < 3)
            //completionBlock([], false)
        }
        
    }
}
