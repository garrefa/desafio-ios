//
//  ListRepositoriesInteractorTests.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright (c) 2017 Stationfy. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import desafio_ios
import XCTest

class RepositoryServiceMock: RepositoryService {

    var lastSearchParameters: (language: ProgrammingLanguage, sortMethod: SortMethod?, page: UInt)?
    func findRepositories(language: ProgrammingLanguage,
                          sortBy sortMethod: SortMethod?,
                          page: UInt,
                          onCompletion completionBlock: ([Repository], Bool) -> Void,
                          onError errorBlock: (Error) -> Void) {
        lastSearchParameters = (language: language, sortMethod: sortMethod, page: page)
    }
}

class ListRepositoriesInteractorTests: XCTestCase {

    // MARK: - Subject under test
    
    var interactor: DefaultListRepositoriesInteractor!

    // MARK: - Test doubles
    var repositoryServiceMock: RepositoryServiceMock!

    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        repositoryServiceMock = RepositoryServiceMock()
        interactor = DefaultListRepositoriesInteractor(repositoryService: repositoryServiceMock)
    }
    
    // MARK: - Tests
    
    func testSearchParameters_onLoadInitialRepositories() {
        interactor.loadInitialRepositories()
        verifySearchParameters()
    }
    
    private func verifySearchParameters() {
        
        guard let lastSearchParameters = repositoryServiceMock.lastSearchParameters else {
            XCTFail("findRepositories was not called on the repository service")
            return
        }
        XCTAssert(lastSearchParameters.language == .java, "interactor should be searching for java repositories")
        
        guard let sortMethod = lastSearchParameters.sortMethod else {
            XCTFail("interactor should have passed a sort method to the seach")
            return
        }
        XCTAssert(sortMethod.key == .stars && sortMethod.direction == .descending,
                  "interactor should have requested repositories sorted by stars, descending")
    }
    
    func testSearchParameters_onLoadMoreRepositories() {
        interactor.loadMoreRepositories()
        verifySearchParameters()
    }
}
