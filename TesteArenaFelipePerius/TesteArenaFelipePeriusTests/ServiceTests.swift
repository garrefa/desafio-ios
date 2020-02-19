//
//  ServiceTests.swift
//  TesteArenaFelipePeriusTests
//
//  Created by Felipe perius on 19/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import XCTest

@testable import TesteArenaFelipePerius
class ServiceTests: XCTestCase {
    var service = RepositoryWorker()

    override func setUp() {
        service = RepositoryWorker()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchRepositories() {
        let requestExpectation = expectation(description: "Fetch complete.")

        RepositoryWorker.getRepositories(page:1) { (repositories, messageErro) in
            if let error = messageErro {
                 print(error)
            } else {
                let repos =  repositories?.repositoryList
                XCTAssertNotNil(repos, "Fetching repos failed.")
                requestExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: { (error) in
            if error != nil {
                XCTFail("🛑 Request timed out.")
            }
        })
    }

}
