//
//  UITestUtils.swift
//  HACKERUITests
//
//  Created by Danna Lee on 2022/03/25.
//

import Foundation

import UIKit
import XCTest

class UITestsUtils {
  /// 앱을 여는 함수
  static func launchApplication(_ app: XCUIApplication) {
    app.launch()
  }
  
  static func goToNicknameVC(_ app: XCUIApplication) {
    app.launch()
    sleep(1)
    
    XCTAssertTrue(app.isDisplayingSignUpVC)
    let nextButton = app.buttons[SignupVCIdentifier.nextButton]
    nextButton.tap()
  }
}
