//
//  desafio_iosUITests.swift
//  desafio-iosUITests
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import XCTest

class desafio_iosUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }

    func testNormalApplicationFlow() {
        
        // make sure we have a navigation bar on-screen
        let navigationBar = app.navigationBars.element
        XCTAssert(navigationBar.exists)
        
        // assert that we have presented repositories table
        let repositoriesTable = app.tables.element
        XCTAssertTrue(repositoriesTable.exists)
        
        // now we wait for some time and assert that there are items in this table
        let thereAreCells = NSPredicate(format: "count > 0")
        expectation(for: thereAreCells, evaluatedWith: repositoriesTable.cells, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        // scroll to "load more repos" cell
        let originalRepositoriesTableCount = repositoriesTable.cells.count
        let loadMoreReposCell = repositoriesTable.cells.element(boundBy: originalRepositoriesTableCount - 1)
        repositoriesTable.scrollToElement(loadMoreReposCell)
        
        // tap on it
        loadMoreReposCell.tap()
        
        // now we wait for some time and assert that we have more items
        let thereAreMoreCells = NSPredicate(format: "count > %d", originalRepositoriesTableCount)
        expectation(for: thereAreMoreCells, evaluatedWith: repositoriesTable.cells, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        // now, at the same index of the "load more" cell, we'll have a RepositoryCell
        let repositoryCell = repositoriesTable.cells.element(boundBy: originalRepositoriesTableCount - 1)
        
        // tap on it!
        repositoryCell.tap()
        
        // make sure we have a way to go back
        XCTAssert(navigationBar.buttons["Back"].exists)
        
        // assert that we have presented pull requests table
        let pullRequestsTable = app.tables.element
        XCTAssertTrue(pullRequestsTable.exists)
        
        // now we wait for some time and assert that there are items in this table
        let thereArePRCells = NSPredicate(format: "count > 0")
        expectation(for: thereArePRCells, evaluatedWith: pullRequestsTable.cells, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        // scroll to "load more repos" cell again
        let originalPRsTableCount = pullRequestsTable.cells.count
        let loadMorePRsCell = repositoriesTable.cells.element(boundBy: originalPRsTableCount - 1)
        pullRequestsTable.scrollToElement(loadMorePRsCell)
        
        // tap on it
        loadMorePRsCell.tap()
        
        // now we wait for some time and assert that we have more items
        let thereAreMorePRCells = NSPredicate(format: "count > %d", originalPRsTableCount)
        expectation(for: thereAreMorePRCells, evaluatedWith: pullRequestsTable.cells, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        // now, at the same index of the "load more" cell, we'll have a RepositoryCell
        let pullRequestCell = pullRequestsTable.cells.element(boundBy: originalPRsTableCount - 1)
        
        // tap on it and we'll go to Safari!
        pullRequestCell.tap()
    }
}
