//
//  XCUIApplication+Extension.swift
//  HACKERUITests
//
//  Created by Danna Lee on 2022/03/25.
//

import XCTest

extension XCUIApplication {
  func isDisplayingText(_ textIdentifier: String) -> Bool {
    staticTexts[textIdentifier].exists
  }
  
  func isDisplayingText(_ textIdentifier: String, timeout: Double) -> Bool {
    staticTexts[textIdentifier].waitForExistence(timeout: timeout)
  }
  
  func isDisplayingTextField(_ textFieldIdentifier: String) -> Bool {
    textFields[textFieldIdentifier].exists
  }
  
  func isDisplayingButton(_ buttonIdentifier: String) -> Bool {
    buttons[buttonIdentifier].exists
  }
  
  func isDisplayingButton(_ buttonIdentifier: String, timeout: Double) -> Bool {
    buttons[buttonIdentifier].waitForExistence(timeout: timeout)
  }
  
  func isDisplayingImage(_ imageIdentifier: String) -> Bool {
    images[imageIdentifier].exists
  }
  
  func isDisplayingSwitch(_ switchIdentifier: String) -> Bool {
    switches[switchIdentifier].exists
  }
  
  var isDisplayingSignUpVC: Bool {
    otherElements[SignupVCIdentifier.view].exists
  }
  
  var isDisplayingNicknameVC: Bool {
    otherElements[NicknameVCIdentifier.view].exists
  }
}
