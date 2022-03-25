//
//  UITextField+Extension.swift
//  HACKER
//
//  Created by 김지수 on 2022/02/22.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - UITextField
extension UITextField {
  func setClearButton(with image: UIImage, mode: UITextField.ViewMode) {
    let clearButton = UIButton(type: .custom)
    clearButton.setImage(image, for: .normal)
    clearButton.frame = CGRect(x: 0, y: 0, width: 35, height: 34)
    clearButton.contentMode = .scaleAspectFit
    clearButton.addTarget(self, action: #selector(UITextField.clear(sender:)), for: .touchUpInside)
    self.rightView = clearButton
    self.rightViewMode = mode
  }
  @objc private func clear(sender: AnyObject) {
    self.text = ""
  }
  /// 클리어 버튼 클릭 시 텍스트필드 내용 삭제
  func setClearNickNameButton(with image: UIImage, mode: UITextField.ViewMode) {
    let clearButton = UIButton(type: .custom)
    clearButton.setImage(UIImage(named: "xWhite"), for: .normal)
    clearButton.frame = CGRect(x: 0, y: 0, width: 35, height: 34)
    clearButton.contentMode = .scaleAspectFit
    clearButton.addTarget(self, action: #selector(UITextField.clearText(sender:)), for: .touchUpInside)
    self.rightView = clearButton
    self.rightViewMode = mode
  }
  @objc private func clearText(sender: AnyObject) {
    self.text = ""
  }
}
