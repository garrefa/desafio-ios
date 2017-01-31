//
//  RoundedImageImageViewTests.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 31/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import XCTest
@testable import Desafio_iOS

class RoundedImageImageViewTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
    
  }
    
  override func tearDown() {
    super.tearDown()
  }
  
  func testIfIsRoundedAfterLayoutSubviews() {
    let roundedImageView = RoundedImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    roundedImageView.layoutSubviews()
    XCTAssertTrue(roundedImageView.layer.cornerRadius == roundedImageView.frame.width / 2, "Is not rounded")
    XCTAssertTrue(roundedImageView.layer.cornerRadius == roundedImageView.frame.height / 2, "Is not rounded")
    XCTAssertTrue(roundedImageView.layer.masksToBounds == true, "Mask to bounds is false")
  }

}
