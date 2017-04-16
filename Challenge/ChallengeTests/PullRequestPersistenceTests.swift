//
//  PullRequestPersistenceTests.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//

import XCTest

@testable import Challenge

class PullRequestPersistenceTests: XCTestCase {
    
    func testingGetRequests() {
        
        var requests = [PullRequest]()
        let expec = expectation(description: "Request return")
        
        PullRequestHandler.requestsFrom(login: "elastic", name: "elasticsearch"){ (result: [PullRequest]) in
            requests = result
            expec.fulfill()
        }
        
        waitForExpectations(timeout: 10.0) { (error) in
            XCTAssert(requests.count > 0)
        }
    }
    
}
