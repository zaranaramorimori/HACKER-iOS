//
//  HACKERUITests.swift
//  HACKERUITests
//
//  Created by Danna Lee on 2022/03/22.
//

import XCTest
import HACKER
import SwiftUI

class HACKERUITests: XCTestCase {
  
  let app = XCUIApplication()
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  override func tearDownWithError() throws {
    
  }
  
  func testLaunch() throws {
    UITestsUtils.launchApplication(app)
  }
}
