//
//  HACKERUITests.swift
//  HACKERUITests
//
//  Created by Danna Lee on 2022/03/22.
//

import XCTest
import HACKER

class HACKERUITests: XCTestCase {
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  override func tearDownWithError() throws {
    
  }
  
  func testLaunch() throws {
    let app = XCUIApplication()
    app.launch()
  }
}
