//
//  RepositoryTests.swift
//  GitHub
//
//  Created by Juliana Lacerda on 05/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import GitHub

class RepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchRepositories() {
        let asyncExpectation = expectation(description: "integrationWithSearchRepositories")
        var repositories = [RepositoryEntity]()
        
        GitHubAPI.getRepositories(page: 1, language: "Java", sort: "stars") { (statusCode, result) in
            if statusCode == GitHubAPI.statusCodes.resultOk.rawValue {
                repositories.append(contentsOf: result)
            }
            
            asyncExpectation.fulfill()
            
        }
        
        self.waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Integration test with SearchRepositories is Not Working")
            XCTAssertTrue(repositories.count > 0, "Repository list wasnt filled")
        }
    }
    
    func testRepositoryEntity() {
         
        let jsonRepository: JSON =  ["id": 1245, "name": "Jack", "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "forks_count": 800, "stargazers_count": 900, "owner": ["id": 3455, "login": "Fulano", "avatar_url": "https://avatars.githubusercontent.com/u/6407041?v=3", "url": "https://api.github.com/users/ReactiveX"], "pulls_url": "https://api.github.com/repos/ReactiveX/RxJava/pulls{/number}"]
        
        let repository = RepositoryEntity(rawData: jsonRepository)
        
        XCTAssertEqual(1245, repository.repositoryId)
        XCTAssertEqual("Jack", repository.name)
        XCTAssertEqual("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", repository.descript)
        XCTAssertEqual(800, repository.forksNum)
        XCTAssertEqual(900, repository.startsNum)
        
        let jsonOwner:JSON = ["id": 3455, "login": "Fulano", "avatar_url": "https://avatars.githubusercontent.com/u/6407041?v=3", "url": "https://api.github.com/users/ReactiveX"]
        
        let owner = OwnerEntidy(rawData: jsonOwner)
        
        XCTAssertEqual(3455, owner.ownerId)
        XCTAssertEqual("Fulano", owner.login)
        XCTAssertEqual("https://avatars.githubusercontent.com/u/6407041?v=3", owner.avatarUrl?.absoluteString)
        XCTAssertEqual("https://api.github.com/users/ReactiveX", owner.infoUrl)
        
    }
    
}
