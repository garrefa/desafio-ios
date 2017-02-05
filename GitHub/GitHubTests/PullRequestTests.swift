//
//  PullRequestTests.swift
//  GitHub
//
//  Created by Juliana Lacerda on 05/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import GitHub

class PullRequestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testListPullRequest() {
        let asyncExpectation = expectation(description: "integrationWithListPullRequest")
        var pulls = [PullRequestEntidy]()
        
        GitHubAPI.getPullRequests(url: "https://api.github.com/repos/ReactiveX/RxJava/pulls?state=all") { (statusCode, result) in
            if statusCode == GitHubAPI.statusCodes.resultOk.rawValue {
                pulls.append(contentsOf: result)
            }
            
            asyncExpectation.fulfill()
            
        }
        
        self.waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Integration test with ListPullRequest is Not Working")
            XCTAssertTrue(pulls.count > 0, "PullRequest list wasnt filled")
        }
    }
    
    func testPullRequestEntidy() {
        
        let jsonPullRequest: JSON = ["id": 234, "title": "2.x: compatibility fixes", "body": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "user": ["id": 3455, "login": "Fulano", "avatar_url": "https://avatars.githubusercontent.com/u/6407041?v=3", "url": "https://api.github.com/users/ReactiveX"],"state": "closed", "html_url": "https://github.com/ReactiveX/RxJava/pull/5069", "created_at": "2017-02-04T14:05:54Z"]
        
        let pull = PullRequestEntidy(rawData: jsonPullRequest)
        
        XCTAssertEqual(234, pull.pullRequestId)
        XCTAssertEqual("2.x: compatibility fixes", pull.title)
        XCTAssertEqual("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", pull.body)
        XCTAssertEqual("closed", pull.state)
        XCTAssertEqual("https://github.com/ReactiveX/RxJava/pull/5069", pull.htmlUrl?.absoluteString)
        XCTAssertEqual("04/02/2017", pull.createdDateString)
        

    }

    
    
}
