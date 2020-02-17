//
//  APIKitTests.swift
//  APIKitTests
//
//  Created by Bruno Wide on 16/02/20.
//  Copyright © 2020 BWide. All rights reserved.
//

import XCTest
@testable import APIKit

class APIKitTests: XCTestCase {
    
    var controller = GithubController()

    override func setUp() {
        controller = GithubController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchRepositories() {
        let requestExpectation = expectation(description: "Fetch complete.")
     
        controller.searchRepositories(query: "language:Swift", sort: .stars, page: 1) { result in
            switch result {
            case let .success(response):
                let repos = response.items
                XCTAssertNotNil(repos, "Fetching repos failed.")
                requestExpectation.fulfill()
            case let .failure(error):
                print(error)
            }
        }
                
        waitForExpectations(timeout: 10, handler: { (error) in
            if error != nil {
                XCTFail("🛑 Request timed out.")
            }
        })
    }
    
    func testFetchPr() {
        let requestExpectation = expectation(description: "Fetched all repos.")
        
        controller.searchRepositories(query: "language:java", sort: .stars, page: 1) { result in
            switch result {
            case let .success(response):
                guard let repos = response.items?.prefix(15) else { XCTFail(); return }
                var pullRequestsCount = 0
                
                for repo in repos {
                    usleep(500000)
                    self.controller.repositoryPullRequests(owner: repo.owner!.login!, name: repo.name!) { result in
                        switch result {
                        case let .success(pullRequests):
                            pullRequestsCount += 1
                            print(pullRequestsCount)
                            if pullRequestsCount == repos.count {
                                requestExpectation.fulfill()
                            }
                        case let .failure(error):
                            XCTFail()
                        }
                    }
                }
            case let .failure(error):
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 50, handler: { (error) in
            if error != nil {
                XCTFail("🛑 Request timed out.")
            }
        })
    }
}
