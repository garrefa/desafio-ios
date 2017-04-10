//
//  ModelTests.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 10/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import XCTest
@testable import desafio_ios

class ModelTests: XCTestCase {
    
    func testRepository() {
        let repository = Repository.fromExampleJSON()
        XCTAssert(repository.name == "storm")
        XCTAssert(repository.description == "Distributed and fault-tolerant realtime computation: stream processing,"
            + " continuous computation, distributed RPC, and more")
        XCTAssert(repository.stargazersCount == 8964)
        XCTAssert(repository.forksCount == 1795)
        XCTAssert(repository.owner.login == "nathanmarz")
        XCTAssertNotNil(repository.owner.avatarURL)
    }
    
    func testPullRequest() {
        let pullRequest = PullRequest.fromExampleJSON()
        XCTAssert(pullRequest.state == .closed)
        XCTAssert(pullRequest.title == "2.x: prevent tasks to self interrupt on the standard schedulers")
        XCTAssert(pullRequest.body == "Task wrappers of the various schedulers and modes (direct & worker) were able to" +
            " get cancelled via interruption from the same thread they were running.\r\n\r\nRelated #5203.")
        XCTAssert(pullRequest.htmlURL == URL(string: "https://github.com/ReactiveX/RxJava/pull/5207"))
        XCTAssert(pullRequest.author.login == "akarnokd")
        XCTAssertNotNil(pullRequest.author.avatarURL)
    }
    
}
