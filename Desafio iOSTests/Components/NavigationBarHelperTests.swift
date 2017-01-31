//
//  NavigationBarHelper.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 31/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import XCTest
@testable import Desafio_iOS

class NavigationBarHelperTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testIfCreateRoundedButtonHasRightConfigurations() {
    let barButton = NavigationBarHelper.createRoundedBarButton(withImage: R.image.ic_star()!, target: nil, action: nil)
    
    let button = barButton.customView as? UIButton
    
    XCTAssertTrue(button != nil, "Button was not created in custom view")
    XCTAssertTrue(button!.isUserInteractionEnabled == true, "Button user interaction enable can not be false")
    XCTAssertTrue(button!.backgroundImage(for: .normal) != nil , "Background image is nil")
    XCTAssertTrue(button!.frame.width == 32, "Width is not 32")
    XCTAssertTrue(button!.frame.height == 32, "Height is not 32")
    XCTAssertTrue(button!.layer.cornerRadius == 16, "Corner radius is not a half of height and widht")
    XCTAssertTrue(button!.layer.masksToBounds == true, "MaskToBounds is not true")
  }
  
  func testIfCreateBarButtonHasRightConfigurations() {
    let barButton = NavigationBarHelper.createBarButton(withImage: R.image.ic_star()!, target: nil, action: nil)
    
    let button = barButton.customView as? UIButton
    
    XCTAssertTrue(button != nil, "Button was not created in custom view")
    XCTAssertTrue(button!.isUserInteractionEnabled == true, "Button user interaction enable can not be false")
    XCTAssertTrue(button!.backgroundImage(for: .normal) != nil , "Background image is nil")
    XCTAssertTrue(button!.frame.width == R.image.ic_star()!.size.width, "Width is not the same")
    XCTAssertTrue(button!.frame.height == R.image.ic_star()!.size.height, "Height is not the same")
  }
  
}
