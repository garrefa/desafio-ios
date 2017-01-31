//
//  APIManagerIntegrationTests.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 31/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import XCTest
@testable import Desafio_iOS

class APIManagerIntegrationTests: XCTestCase {
    
    override func setUp() {
      super.setUp()
    }
    
    override func tearDown() {
      super.tearDown()
    }
    
    func testSearchRepositories() {
      let asyncExpectation = expectation(description: "integrationWithSearchRepositories")
      var repositoryList: RepositoryList! = nil
      
      APIManager.shared.repositories(withLanguage: "Java", page: 0) { (response, error) in
        if let list = response as? RepositoryList {
          repositoryList = list
        }
        
        asyncExpectation.fulfill()
      }
      
      
      self.waitForExpectations(timeout: 5) { (error) in
        XCTAssertNil(error, "Integration test with SearchRepositories is Not Working")
        XCTAssertTrue(repositoryList != nil, "Repository list wasnt filled")
      }
    }
  
  
  func testSearchPullRequests() {
    let bundle = Bundle(for: type(of: self))
    let filePath = bundle.path(forResource: "RepositoryItens", ofType: "json")!
    let jsonData = FileManager.default.contents(atPath: filePath)
    
    do {
      let jsonMockRepositories = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [String : Any]
      let arrayRepositories = jsonMockRepositories!["items"] as! [[String:Any]]
      let repositories: [Repository] = arrayRepositories.arrayOfClass()
      let firstRepository = repositories.first!
      
      let asyncExpectation = expectation(description: "integrationWithPullRequests")
      var pullRequests: [PullRequest]! = nil
      
      APIManager.shared.pullRequests(withRepository: firstRepository, completion: { (response, error) in
        if let list = response as? [PullRequest] {
          pullRequests = list
        }
        
        asyncExpectation.fulfill()
      })
      
      
      self.waitForExpectations(timeout: 5) { (error) in
        XCTAssertNil(error, "Integration test with SearchRepositories is Not Working")
        XCTAssertTrue(pullRequests != nil, "Pull requests list wasnt filled")
      }
      
    } catch {
      
    }
  }
  
}
