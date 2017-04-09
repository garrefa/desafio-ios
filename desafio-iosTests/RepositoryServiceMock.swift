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
    var latestSearchParameters: (language: ProgrammingLanguage, sortMethod: SortMethod?, page: UInt)!
    var findRepositoriesShouldFail = false
    func findRepositories(language: ProgrammingLanguage,
                          sortBy sortMethod: SortMethod?,
                          page: UInt,
                          onCompletion completionBlock: @escaping ([Repository], Bool) -> Void,
                          onError errorBlock: @escaping (Error) -> Void) {
        latestSearchParameters = (language: language, sortMethod: sortMethod, page: page)
        if findRepositoriesShouldFail {
            errorBlock(NSError(domain: "", code: 0, userInfo: .none))
        } else {
            completionBlock(findRepositoriesExpectedResult.repositories, findRepositoriesExpectedResult.hasMorePages)
        }
    }
}
