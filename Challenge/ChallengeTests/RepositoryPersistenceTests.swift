//
//  RepositoryPersistenceTests.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//

import XCTest

@testable import Challenge

class RepositoryPersistenceTests: XCTestCase {
    
    
    func testingGetRepositories() {
        
        var repositories = [Repository]()
        let expec = expectation(description: "Request return")
        
        RepositoryHandler.repositoriesFrom(page: "1"){ (result: [Repository]) in
            repositories = result
            
            expec.fulfill()
        }
        
        waitForExpectations(timeout: 10.0) { (error) in
            XCTAssert(repositories.count > 0)
        }
        
    }
    
    
}
