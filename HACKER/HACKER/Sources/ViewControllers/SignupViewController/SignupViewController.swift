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
  
  var nextButtonYValue = CGFloat(0)
  
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
      $0.image = UIImage(named: "logoIcon")
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
      $0.setupLabel(text: "안녕하세요!", color: .hackerBlack, font: .titleBold24)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.hackerImageView.snp.bottom).offset(16)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutExplainLabel() {
    self.view.add(explainLabel) {
      $0.setupLabel(text: "Github 유저 네임을 적어주세요", color: .hackerBlack, font: .subtitleMedium16)
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
      $0.textColor = .hackerDarkGray
      $0.autocorrectionType = .no
      $0.autocapitalizationType = .none
      $0.setClearButton(with: UIImage(named: "xWhite") ?? UIImage.checkmark, mode: .whileEditing)
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.textBorderView)
        $0.leading.equalTo(self.textBorderView.snp.leading).offset(16)
        $0.trailing.equalTo(self.textBorderView.snp.trailing).offset(-8)
        $0.height.equalTo(23)
      }
    }
  }
  func layoutClearButton() {
    self.textBorderView.add(clearButton) {
      $0.setImage(UIImage(named: "xBlack"), for: .normal)
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
      $0.setupButton(title: "다음", color: .hackerDarkGray, font: .btnText, backgroundColor: .clear, state: .normal, radius: 0)
      $0.titleLabel?.textAlignment = .center
      $0.addTextSpacing(10)
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.bottom.equalToSuperview().offset(-39)
      }
    }
  }
}

// MARK: - Keyboard Extension
extension SignupViewController {
  /// 키보드가 올라오면 버튼도 따라서 올라오게
  func setKeyboardObserver() {
    NotificationCenter.default.addObserver(self, selector: #selector(textViewMoveUp), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(textViewMoveDown), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func textViewMoveUp(_ notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
      UIView.animate(withDuration: 0.3, animations: {
        self.nextButton.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height)
      })
    }
  }
  @objc func textViewMoveDown(_ notification: NSNotification) {
    self.nextButton.transform = .identity
  }
}

// MARK: - UITextFieldDelegate
extension SignupViewController: UITextFieldDelegate {
  
  /// Return 눌렀을 때 키보드 내리기
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  /// TextField 활성화 되었을 때
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textBorderView.backgroundColor = .black
    textField.textColor = .hackerWhite
    clearButton.setBackgroundImage(UIImage(named: "xWhite"), for: .normal)
    nextButton.setupButton(title: "다음", color: .hackerWhite, font: .btnText, backgroundColor: .clear, state: .normal, radius: 0)
    nextButton.setBackgroundImage(UIImage(named: "nextBtnBlack"), for: .normal)
  }
  /// TextField 비활성화 되었을 때
  func textFieldDidEndEditing(_ textField: UITextField) {
    textBorderView.backgroundColor = .white
    textField.textColor = .hackerBlack
    clearButton.setBackgroundImage(UIImage(named: "xBlack"), for: .normal)
    nextButton.setupButton(title: "다음", color: .hackerDarkGray, font: .btnText, backgroundColor: .clear, state: .normal, radius: 0)
    nextButton.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
  }
}

//MARK: - UITextField
extension UITextField {
  /// 클리어 버튼 클릭 시 텍스트필드 내용 삭제
  func setClearButton(with image: UIImage, mode: UITextField.ViewMode) {
    let clearButton = UIButton(type: .custom)
    clearButton.setImage(image, for: .normal)
    clearButton.frame = CGRect(x: 0, y: 0, width: 35, height: 34)
    clearButton.contentMode = .scaleAspectFit
    clearButton.addTarget(self, action: #selector(UITextField.clear(sender:)), for: .touchUpInside)
    self.rightView = clearButton
    self.rightViewMode = mode
  }
  
  @objc
  private func clear(sender: AnyObject) {
    self.text = ""
  }
}
