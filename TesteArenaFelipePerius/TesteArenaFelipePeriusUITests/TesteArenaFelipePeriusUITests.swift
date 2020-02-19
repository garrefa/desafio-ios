//
//  TesteArenaFelipePeriusUITests.swift
//  TesteArenaFelipePeriusUITests
//
//  Created by Felipe perius on 14/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import XCTest

class TesteArenaFelipePeriusUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPagination() {
        let app = XCUIApplication()
        app.launch()
        // Get a handle for the tableView
        let listpagetableviewTable = app.tables["hometableView"]

        // Get a handle for the not yet existing cell by its content text
        let cell = listpagetableviewTable.staticTexts["CS-Notes"]

        // Swipe down until it is visible
        while !cell.exists {
                        app.swipeUp()
        }

        // Interact with it when visible
        cell.tap()
    }
    

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
