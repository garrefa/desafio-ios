//
//  TestExtensions.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 10/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    func scrollToElement(_ element: XCUIElement) {
        while !element.isHittable {
            swipeUp()
        }
    }
}
