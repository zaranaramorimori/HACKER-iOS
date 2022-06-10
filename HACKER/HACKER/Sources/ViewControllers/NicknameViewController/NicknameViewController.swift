//
//  NicknameViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/02/08.
//

import UIKit

import SnapKit
import Then

// MARK: - NicknameViewController
class NicknameViewController: UIViewController {
  
  // MARK: - Components
  let hackerImageView = UIImageView()
  let helloLabel = UILabel()
  let explainLabel = UILabel()
  let textBorderView = UIView()
  let usernameTextField = UITextField()
  let countTextLabel = UILabel()
  let nextButton = UIButton()
  
  final let maxLength = 6
  var userGithubName: String?
  var socialType = ""
  var uuid = ""
  
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
    attribute()
    setKeyboardObserver()
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(textDidChange(_:)),
                                           name: UITextField.textDidChangeNotification,
                                           object: usernameTextField)
  }
}

// MARK: - Extensions
extension NicknameViewController {
  func setBackground() {
      self.view.backgroundColor = .white
      self.navigationController?.navigationBar.isHidden = true
  }
  func layout() {
    layoutHackerImageView()
    layoutHelloLabel()
    layoutExplainLabel()
    layoutTextBorderview()
    layoutUserNameTextField()
    layoutCountTextLabel()
    layoutNextButton()
  }
  func attribute() {
    self.usernameTextField.delegate = self
    self.view.accessibilityIdentifier = NicknameVCIdentifier.view
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
      $0.setupLabel(text: "안녕하세요!", color: .hackerBlack, font: .titleBold(ofSize: 24))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.hackerImageView.snp.bottom).offset(16)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutExplainLabel() {
    self.view.add(explainLabel) {
      $0.setupLabel(text: "회원님을 뭐라고 부르면 좋을까요?", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
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
      $0.placeholder = "사용하실 닉네임을 입력해주세요"
      $0.textColor = .hackerDarkGray
      $0.autocorrectionType = .no
      $0.autocapitalizationType = .none
      $0.clearButtonMode = .always
      if let clearButton = self.usernameTextField.value(forKeyPath: "_clearButton") as? UIButton {
        clearButton.setImage(UIImage(named: "xWhite"), for: .normal)
      }
      $0.accessibilityIdentifier = NicknameVCIdentifier.usernameTextField
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.textBorderView)
        $0.leading.equalTo(self.textBorderView.snp.leading).offset(16)
        $0.trailing.equalTo(self.textBorderView.snp.trailing).offset(-8)
        $0.height.equalTo(23)
      }
    }
  }
  func layoutCountTextLabel() {
    self.view.add(countTextLabel) {
      $0.setupLabel(text: "0/6", color: .hackerBlack, font: .bodyRegular(ofSize: 14))
      $0.textColor = .clear
      $0.accessibilityIdentifier = NicknameVCIdentifier.countTextLabel
      $0.snp.makeConstraints {
        $0.top.equalTo(self.textBorderView.snp.bottom).offset(5)
        $0.trailing.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutNextButton() {
    self.view.add(nextButton) {
      $0.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
      $0.setupButton(title: "시작!", color: .hackerDarkGray, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
      $0.accessibilityIdentifier = NicknameVCIdentifier.nextButton
      $0.titleLabel?.textAlignment = .center
      $0.addTextSpacing(10)
      $0.addTarget(self, action: #selector(self.nextButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.bottom.equalToSuperview().offset(-39)
      }
    }
  }
}

// MARK: - Keyboard Extension
extension NicknameViewController {
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
  @objc func nextButtonClicked() {
    userNicknameWithAPI(nicknameRequest: NickNameRequest(social: socialType,
                                                         uuid: uuid,
                                                         username: userGithubName ?? "",
                                                         nickname: usernameTextField.text ?? ""))
    if !usernameTextField.hasText {
      self.makeAlertOnlyMessage(message: "닉네임을 입력하세요", okAction: nil)
    }

  }
}

// MARK: - UITextFieldDelegate
extension NicknameViewController: UITextFieldDelegate {
  
  /// Return 눌렀을 때 키보드 내리기
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  /// TextField 활성화 되었을 때
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textBorderView.backgroundColor = .black
    textField.textColor = .hackerWhite
    nextButton.setupButton(title: "시작!", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
    nextButton.setBackgroundImage(UIImage(named: "nextBtnBlack"), for: .normal)
    countTextLabel.textColor = .hackerBlack
  }
  /// TextField 비활성화 되었을 때
  func textFieldDidEndEditing(_ textField: UITextField) {
    textBorderView.backgroundColor = .white
    textField.textColor = .hackerBlack
    if let clearButton = self.usernameTextField.value(forKeyPath: "_clearButton") as? UIButton {
      clearButton.setImage(UIImage(named: "xBlack"), for: .normal)
    }
    nextButton.setupButton(title: "시작!", color: .hackerDarkGray, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
    nextButton.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
  }
  /// nameTextField 글자수 세기, 제한
  @objc private func textDidChange(_ notification: Notification) {
    if let textField = notification.object as? UITextField {
      if let text = textField.text {
        
        if text.count > maxLength {
          // 6글자 넘어가면 자동으로 키보드 내려감
          //          textField.resignFirstResponder()
          let countNum = textField.text?.count ?? 0
          countTextLabel.text = "\(countNum)/6"
        }
        
        // 초과되는 텍스트 제거
        if text.count >= maxLength {
          let index = text.index(text.startIndex, offsetBy: maxLength)
          let newString = text[text.startIndex..<index]
          textField.text = String(newString)
          let countNum = textField.text?.count ?? 0
          countTextLabel.text = "\(countNum)/6"
        } else {
          explainLabel.text = "와 제법 멋진 이름이네요"
          let countNum = textField.text?.count ?? 0
          countTextLabel.text = "\(countNum)/6"
        }
        if text.isEmpty {
          explainLabel.text = "사용하실 닉네임을 입력해주세요"
        }
      }
      self.explainLabel.text = "와 제법 멋진 이름이네요"
      if let clearButton = self.usernameTextField.value(forKeyPath: "_clearButton") as? UIButton {
        clearButton.setImage(UIImage(named: "xWhite"), for: .normal)
      }
      self.nextButton.setBackgroundImage(UIImage(named: "nextBtnBlack"), for: .normal)
      self.nextButton.setTitleColor(.hackerWhite, for: .normal)
    }
  }
}

// MARK: - Network
extension NicknameViewController {
  func userNicknameWithAPI(nicknameRequest: NickNameRequest) {
    LoadingHUD.show()
    NickNAmeAPI.shared.userNickname(nicknameRequest: nicknameRequest) { response in
      LoadingHUD.hide()
      switch response {
      case .success(let data):
        print("성공티비")
        if let nickNameInfo = data as? NickNameResponse {
          UserDefaults.standard.set(nickNameInfo.accessToken, forKey: Const.UserDefaultsKey.accessToken)
          UserDefaults.standard.set(nickNameInfo.refreshToken, forKey: Const.UserDefaultsKey.refreshToken)
          UserDefaults.standard.set(nickNameInfo.username, forKey: Const.UserDefaultsKey.username)
          UserDefaults.standard.set(nickNameInfo.nickname, forKey: Const.UserDefaultsKey.nickname)
          UserDefaults.standard.set(nickNameInfo.userId, forKey: Const.UserDefaultsKey.userID)
          let tabbarVC = TabBarViewController()
          self.changeRootViewController(tabbarVC)
        }
      case .requestErr(let status):
        print("userNicknameWithAPI - requestErr: \(status)")
        if let statusCode = status as? Int {
          switch statusCode {
          case 409 :
            self.explainLabel.text = "앗! 이미 사용중인 이름이에요 :)"
            if let clearButton = self.usernameTextField.value(forKeyPath: "_clearButton") as? UIButton {
              clearButton.setImage(UIImage(named: "xRed"), for: .normal)
            }
            self.nextButton.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
            self.nextButton.setTitleColor(.hackerDarkGray, for: .normal)
          default :
            break
          }
        }
      case .pathErr:
        print("userNicknameWithAPI - pathErr")
      case .serverErr:
        print("userNicknameWithAPI - serverErr")
      case .networkFail:
        print("userNicknameWithAPI - networkFail")
      default:
        print("default!")
      }
    }
  }
}
