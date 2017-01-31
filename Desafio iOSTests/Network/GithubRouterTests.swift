//
//  GithubRouterTests.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 31/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import XCTest
import Alamofire
@testable import Desafio_iOS

class GithubRouterTests: XCTestCase {
  
  override func setUp() {
    super.setUp()    
  }
    
  override func tearDown() {
    super.tearDown()
  }
    
  func testSearchRepositories() {
    let router = GithubRouter(endpoint: .SearchRepositories(language: "Java", page: 0))
    
    XCTAssertTrue(router.path == "search/repositories", "It does not have the correct path")
    XCTAssertTrue(router.method == .get, "HTTP Method is not get")
    XCTAssertTrue(router.parameters != nil, "There is no parameters")
    XCTAssertTrue(router.encoding as? URLEncoding != nil, "Is not URL Encoding")
  }
  
  
  func testPullRequestsOfARepository() {
    let bundle = Bundle(for: type(of: self))
    let filePath = bundle.path(forResource: "RepositoryItens", ofType: "json")!
    let jsonData = FileManager.default.contents(atPath: filePath)
    
    do {
      let jsonMockRepositories = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [String : Any]
      let arrayRepositories = jsonMockRepositories!["items"] as! [[String:Any]]
      let repositories: [Repository] = arrayRepositories.arrayOfClass()
      let repository = repositories.first!
      
      let router = GithubRouter(endpoint: .PullRequestsOfARepository(repository: repository))
      XCTAssertTrue(router.path == "repos/\(repository.owner.login!)/\(repository.name!)/pulls", "It does not have the correct path")
      XCTAssertTrue(router.method == .get, "HTTP Method is not get")
      XCTAssertTrue(router.parameters != nil, "There is no parameters")
      XCTAssertTrue(router.encoding as? URLEncoding != nil, "Is not URL Encoding")            
    } catch {
      
    }
  }
  
}
