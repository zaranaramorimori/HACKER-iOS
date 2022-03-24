//
//  NicknameUITests.swift
//  HACKERUITests
//
//  Created by Danna Lee on 2022/03/25.
//

import XCTest

class NicknameUITests: XCTestCase {
  
  let app = XCUIApplication()
  
  override func setUpWithError() throws {
    UITestsUtils.goToNicknameVC(app)
    continueAfterFailure = true
  }
  
  override func tearDownWithError() throws {
    app.terminate()
  }
  
   /// 닉네임 입력받는 텍스트필드 테스트
  func testNicknameInput() {
    let textField = app.textFields[NicknameVCIdentifier.usernameTextField]
    let nextButton = app.buttons[NicknameVCIdentifier.nextButton]
    let countLabel = app.staticTexts[NicknameVCIdentifier.countTextLabel]
    
    // 텍스트필드에 올바른 닉네임 입력 테스트
    textField.tap()
    textField.typeText("다나")
    XCTAssertNotNil(textField.value, TestErrorMessage.textfieldInputOutputMismatch)
    XCTAssertEqual(textField.value as? String, "다나", TestErrorMessage.textfieldInputOutputMismatch)
    XCTAssertTrue(nextButton.isEnabled, TestErrorMessage.nextButtonDisabled)
    XCTAssertEqual(countLabel.label, "2/6", TestErrorMessage.wrongCountText)
  }
  
  /// 입력한 텍스트 모두 지우는 테스트
  func testNicknameDelete() {
    let textField = app.textFields[NicknameVCIdentifier.usernameTextField]
    let nextButton = app.buttons[NicknameVCIdentifier.nextButton]
    let countLabel = app.staticTexts[NicknameVCIdentifier.countTextLabel]
    
    guard let stringValue = textField.value as? String else {
      return
    }
    var deleteString = String()
    for _ in stringValue {
      deleteString += XCUIKeyboardKey.delete.rawValue
    }
    textField.typeText(deleteString)
    XCTAssertEqual(textField.value as? String, textField.placeholderValue, TestErrorMessage.textFieldNotEmpty)
    XCTAssertFalse(nextButton.isEnabled, TestErrorMessage.nextButtonEnabled)
    XCTAssertEqual(countLabel.label, "0/6", TestErrorMessage.wrongCountText)
  }
  
  /// 텍스트필드 클리어 버튼 눌렀을 때 테스트
  func testClearButton() {
    let textField = app.textFields[NicknameVCIdentifier.usernameTextField]
    let clearButton = app.buttons[NicknameVCIdentifier.clearButton]
    let nextButton = app.buttons[NicknameVCIdentifier.nextButton]
    let countLabel = app.staticTexts[NicknameVCIdentifier.countTextLabel]
    
    // 텍스트필드에 더미값 입력
    textField.tap()
    textField.typeText("danna")
    
    // x 버튼을 눌러 텍스트필드 입력값 초기화 테스트
    XCTAssertTrue(clearButton.isHittable, TestErrorMessage.buttonNotHittable)
    clearButton.tap()
    XCTAssertEqual(textField.value as? String, "", TestErrorMessage.textFieldNotEmpty)
    XCTAssertFalse(nextButton.isEnabled, TestErrorMessage.nextButtonEnabled)
    XCTAssertEqual(countLabel.label, "0/6", TestErrorMessage.wrongCountText)
  }
}
