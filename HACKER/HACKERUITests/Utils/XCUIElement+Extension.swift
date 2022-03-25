//
//  XCUIElement+Extension.swift
//  HACKERUITests
//
//  Created by Danna Lee on 2022/03/25.
//

import XCTest

extension XCUIElement {
  /// 텍스트필드의 모든 텍스트를 삭제
  func clearText() {
    guard let stringValue = self.value as? String else {
      XCTFail("Tried to clear text into a non string value")
      return
    }
    
    self.tap()
    
    let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
    
    self.typeText(deleteString)
  }
}
