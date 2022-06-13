//
//  SignupViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/02/08.
//

import UIKit

import SnapKit
import Then
import CoreMedia

// MARK: - SignupViewController
class SignupViewController: UIViewController {
  
  // MARK: - Components
  let hackerImageView = UIImageView()
  let helloLabel = UILabel()
  let explainLabel = UILabel()
  let textBorderView = UIView()
  let usernameTextField = UITextField()
  let nextButton = UIButton()
  
  var socialType = ""
  var uuid = ""
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
    attribute()
    setKeyboardObserver()
    dismissKeyboardWhenTappedAround()
  }
}

// MARK: - Extensions
extension SignupViewController {
  func setBackground() {
      self.view.backgroundColor = .hackerWhite
      self.navigationController?.navigationBar.isHidden = true
  }
  func layout() {
    layoutHackerImageView()
    layoutHelloLabel()
    layoutExplainLabel()
    layoutTextBorderview()
    layoutUserNameTextField()
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
      $0.setupLabel(text: "안녕하세요!", color: .hackerBlack, font: .titleBold(ofSize: 24))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.hackerImageView.snp.bottom).offset(16)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutExplainLabel() {
    self.view.add(explainLabel) {
      $0.setupLabel(text: "Github 유저 네임을 적어주세요", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
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
    self.textBorderView.add(usernameTextField) {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.placeholder = "유저 네임을 정확하게 입력해주세요"
      $0.textColor = .hackerDarkGray
      $0.autocorrectionType = .no
      $0.autocapitalizationType = .none
      $0.clearButtonMode = .always
      if let clearButton = self.usernameTextField.value(forKeyPath: "_clearButton") as? UIButton {
        clearButton.setImage(UIImage(named: "xWhite"), for: .normal)
      }
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.textBorderView)
        $0.leading.equalTo(self.textBorderView.snp.leading).offset(16)
        $0.trailing.equalTo(self.textBorderView.snp.trailing).offset(-8)
        $0.height.equalTo(23)
      }
    }
  }
  func layoutNextButton() {
    self.view.add(nextButton) {
      $0.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
      $0.setupButton(title: "다음", color: .hackerDarkGray, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
      $0.titleLabel?.textAlignment = .center
      $0.addTextSpacing(10)
      $0.addTarget(self, action: #selector(self.touchNextButton), for: .touchUpInside)
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
  /// 화면전환
  @objc func touchNextButton() {
    /// username 받아오기
    userGithubIDWithAPI(username: self.usernameTextField.text ?? "")
    if !usernameTextField.hasText {
      self.makeAlertOnlyMessage(message: "유저네임을 입력하세요", okAction: nil)
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
  /// TextField 활성화 되었을 때
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textBorderView.backgroundColor = .black
    textField.textColor = .hackerWhite
    nextButton.setupButton(title: "다음", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
    nextButton.setBackgroundImage(UIImage(named: "nextBtnBlack"), for: .normal)
  }
  /// TextField 비활성화 되었을 때
  func textFieldDidEndEditing(_ textField: UITextField) {
    textBorderView.backgroundColor = .white
    textField.textColor = .hackerBlack
    if let clearButton = self.usernameTextField.value(forKeyPath: "_clearButton") as? UIButton {
      clearButton.setImage(UIImage(named: "xBlack"), for: .normal)
    }
    nextButton.setupButton(title: "다음", color: .hackerDarkGray, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
    nextButton.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
  }
}

// MARK: - Network
extension SignupViewController {
  func userGithubIDWithAPI(username: String) {
    LoadingHUD.show()
    SignUpAPI.shared.userGithubName(username: username) { response in
      LoadingHUD.hide()
      switch response {
      case .success(let data):
        if let userGithubInfo = data as? SignUpResponse {
          let signupPopUpVC = SignupPopUpViewController()
          let signupPopUpNVC = UINavigationController(rootViewController: signupPopUpVC)
          signupPopUpVC.userImageView.updateServerImage(userGithubInfo.profileImage)
          signupPopUpVC.userNameLabel.text = userGithubInfo.username
          signupPopUpVC.socialType = self.socialType
          signupPopUpVC.uuid = self.uuid
          signupPopUpNVC.modalPresentationStyle = .overFullScreen
          self.present(signupPopUpNVC, animated: false, completion: nil)
        }
        
      case .requestErr(let status):
        print("userPhotosWithAPI - requestErr: \(status)")
        if let statusCode = status as? Int {
          switch statusCode {
          case 404 :
            let unknownUserVC = UnknownUserPopUpViewController()
            unknownUserVC.modalPresentationStyle = .overFullScreen
            self.present(unknownUserVC, animated: false, completion: nil)
          default :
            break
          }
        }
        
      case .pathErr:
        print("userPhotosWithAPI - pathErr")
      case .serverErr:
        print("userPhotosWithAPI - serverErr")
      case .networkFail:
        print("userPhotosWithAPI - networkFail")
      default:
        print("default!")
      }
    }
  }
}
