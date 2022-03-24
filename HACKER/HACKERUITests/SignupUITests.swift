//
//  SignupTests.swift
//  HACKERUITests
//
//  Created by Danna Lee on 2022/03/23.
//

import XCTest

class SignupUITests: XCTestCase {
  
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  override func tearDownWithError() throws {
    
  }
  
  /// 깃허브 아이디 입력받는 텍스트필드 테스트
  func testGithubIDTextfieldInput() {
    let app = XCUIApplication()
    app.launch()
    
    let textField = app.textFields[NicknameVCIdentifier.usernameTextField]
    
    // 텍스트필드에 올바른 닉네임 입력 테스트
    textField.tap()
    textField.typeText("Daeun-Danna-Lee")
    XCTAssertNotNil(textField.value, TestErrorMessage.textfieldInputOutputMismatch)
    XCTAssertEqual(textField.value as? String, "Daeun-Danna-Lee", TestErrorMessage.textfieldInputOutputMismatch)
    
    // 입력한 텍스트 모두 지우는 테스트
    guard let stringValue = textField.value as? String else {
      return
    }
    var deleteString = String()
    for _ in stringValue {
      deleteString += XCUIKeyboardKey.delete.rawValue
    }
    textField.typeText(deleteString)
    XCTAssertEqual(textField.value as? String, textField.placeholderValue, TestErrorMessage.textFieldNotEmpty)
  }
  
  func testClearButton() {
    let app = XCUIApplication()
    app.launch()
    
    let textField = app.textFields[NicknameVCIdentifier.usernameTextField]
    let clearButton = app.buttons[NicknameVCIdentifier.clearButton]
    
    // 텍스트필드에 더미값 입력
    textField.tap()
    textField.typeText("danna")
    
    // x 버튼을 눌러 텍스트필드 입력값 초기화 테스트
    XCTAssertTrue(clearButton.isHittable, TestErrorMessage.buttonNotHittable)
    clearButton.tap()
    XCTAssertEqual(textField.value as? String, "", TestErrorMessage.textFieldNotEmpty)
    
    
  }
}
