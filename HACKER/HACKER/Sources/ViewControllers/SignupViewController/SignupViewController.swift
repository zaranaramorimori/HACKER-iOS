//
//  SignupViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/02/08.
//

import UIKit

import SnapKit
import Then

// MARK: - SignupViewController
class SignupViewController: UIViewController {
  
  // MARK: - Components
  let hackerImageView = UIImageView()
  let helloLabel = UILabel()
  let explainLabel = UILabel()
  let textBorderView = UIView()
  let usernameTextField = UITextField()
  let clearButton = UIButton()
  let nextButton = UIButton()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    layout()
    attribute()
    setKeyboardObserver()
  }
}

// MARK: - Extensions
extension SignupViewController {
  func layout() {
    layoutHackerImageView()
    layoutHelloLabel()
    layoutExplainLabel()
    layoutTextBorderview()
    layoutUserNameTextField()
    layoutClearButton()
    layoutNextButton()
  }
  func attribute() {
    self.usernameTextField.delegate = self
  }
  func layoutHackerImageView() {
    self.view.add(hackerImageView) {
      $0.image = UIImage(named: "nextBtn")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(32)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(100)
        $0.height.equalTo(100)
      }
    }
  }
  func layoutHelloLabel() {
    self.view.add(helloLabel) {
      $0.setupLabel(text: "안녕하세요!", color: .black, font: .titleBold24)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.hackerImageView.snp.bottom).offset(16)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutExplainLabel() {
    self.view.add(explainLabel) {
      $0.setupLabel(text: "Github 유저 네임을 적어주세요", color: .black, font: .subtitleMedium16)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.helloLabel.snp.bottom).offset(12)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutTextBorderview() {
    self.view.add(textBorderView) {
      $0.setBorder(borderColor: .black, borderWidth: 2)
      $0.setRounded(radius: 10)
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.top.equalTo(self.explainLabel.snp.bottom).offset(52)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(50)
      }
    }
  }
  func layoutUserNameTextField() {
    self.view.add(usernameTextField) {
      $0.placeholder = "Github 유저 네임을 적어주세요."
      $0.textColor = .darkGray
      $0.autocorrectionType = .no
      $0.autocapitalizationType = .none
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.textBorderView)
        $0.leading.equalTo(self.textBorderView.snp.leading).offset(16)
        $0.width.equalTo(218)
        $0.height.equalTo(23)
      }
    }
  }
  func layoutClearButton() {
    self.textBorderView.add(clearButton) {
      $0.setImage(UIImage(named: "nextBtn"), for: .normal)
      $0.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.trailing.equalToSuperview().offset(-8)
        $0.width.equalTo(35)
        $0.height.equalTo(34)
      }
    }
  }
  func layoutNextButton() {
    self.view.add(nextButton) {
      $0.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
      $0.setupButton(title: "다음", color: .darkGray, font: .btnText, backgroundColor: .clear, state: .normal, radius: 0)
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.bottom.equalToSuperview().offset(-39)
      }
    }
  }
}

// MARK: - Extension
extension SignupViewController {
  func setKeyboardObserver() {
    NotificationCenter.default.addObserver(
          self,
          selector: #selector(keyboardWillShow),
          name: UIResponder.keyboardWillShowNotification,
          object: nil
        )
        
        NotificationCenter.default.addObserver(
          self,
          selector: #selector(keyboardWillHide),
          name: UIResponder.keyboardWillHideNotification,
          object: nil
        )
  }
  @objc private func keyboardWillShow(_ notification: Notification) {
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keybaordRectangle = keyboardFrame.cgRectValue
      let keyboardHeight = keybaordRectangle.height
      self.nextButton.frame.origin.y -= keyboardHeight
    }
  }
    
  @objc private func keyboardWillHide(_ notification: Notification) {
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keybaordRectangle = keyboardFrame.cgRectValue
      let keyboardHeight = keybaordRectangle.height
      self.nextButton.frame.origin.y += keyboardHeight
    }
  }
}

// MARK: - UITextFieldDelegate
extension SignupViewController: UITextFieldDelegate {
  
  /// Return 눌렀을 때 키보드 내리기
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textBorderView.backgroundColor = .black
    textField.textColor = .white
  }
  func textFieldDidEndEditing(_ textField: UITextField) {
    textBorderView.backgroundColor = .white
    textField.textColor = .black
  }
}
