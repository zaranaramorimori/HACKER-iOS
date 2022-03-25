//
//  SignupTests.swift
//  HACKERUITests
//
//  Created by Danna Lee on 2022/03/23.
//

import XCTest

class SignupUITests: XCTestCase {
  
  let app = XCUIApplication()
  
  override func setUpWithError() throws {
    UITestsUtils.launchApplication(app)
    continueAfterFailure = true
  }
  
  override func tearDownWithError() throws {
    app.terminate()
  }
  
  /// 깃허브 아이디 입력받는 텍스트필드 테스트
  func testGithubIDTextfieldInput() {
    let textField = app.textFields[SignupVCIdentifier.usernameTextField]
    let nextButton = app.buttons[SignupVCIdentifier.nextButton]
    
    // 텍스트필드에 올바른 닉네임 입력 테스트
    textField.tap()
    textField.typeText("Daeun-Danna-Lee")
    XCTAssertNotNil(textField.value, TestErrorMessage.textfieldInputOutputMismatch)
    XCTAssertEqual(textField.value as? String, "Daeun-Danna-Lee", TestErrorMessage.textfieldInputOutputMismatch)
    XCTAssertTrue(nextButton.isEnabled, TestErrorMessage.nextButtonDisabled)
  }
  
  /// 입력한 텍스트 모두 지우는 테스트
  func testGithubIDTextFieldDelete() {
    let textField = app.textFields[SignupVCIdentifier.usernameTextField]
    let nextButton = app.buttons[SignupVCIdentifier.nextButton]
    
    textField.clearText()
    
    XCTAssertEqual(textField.value as? String, textField.placeholderValue, TestErrorMessage.textFieldNotEmpty)
    XCTAssertFalse(nextButton.isEnabled, TestErrorMessage.nextButtonEnabled)
  }
  
  /// 텍스트필드 클리어 버튼 눌렀을 때 테스트
  func testClearButton() {
    let textField = app.textFields[SignupVCIdentifier.usernameTextField]
    let clearButton = app.buttons[SignupVCIdentifier.clearButton]
    let nextButton = app.buttons[SignupVCIdentifier.nextButton]
    
    // 텍스트필드에 더미값 입력
    textField.tap()
    textField.typeText("danna")
    
    // x 버튼을 눌러 텍스트필드 입력값 초기화 테스트
    XCTAssertTrue(clearButton.isHittable, TestErrorMessage.buttonNotHittable)
    clearButton.tap()
    XCTAssertEqual(textField.value as? String, "", TestErrorMessage.textFieldNotEmpty)
    XCTAssertFalse(nextButton.isEnabled, TestErrorMessage.nextButtonEnabled)
  }
}
