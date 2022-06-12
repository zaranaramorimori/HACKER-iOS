//
//  DeleteAccountViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/03/28.
//

import UIKit

import Lottie

class DeleteAccountViewController: UIViewController {
  
  // MARK: - Components
  private let navigationBar = HackerNavigationBar()
  
  private let goodbyeLabel = UILabel().then {
    $0.setupLabel(text: "정말\n탈퇴하시겠어요..?\n진챠..? 날 두고..?", color: .hackerBlack, font: .titleBold(ofSize: 24))
    $0.numberOfLines = 3
  }
  
  private let cryingManImageView = AnimationView().then {
    $0.animation = Animation.named("cry_Lottie")
    $0.contentMode = .scaleAspectFit
    $0.loopMode = .loop
    $0.play()
  }
  
  private let backButton = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "nextBtnBlack"), for: .normal)
    $0.setupButton(title: "돌아가기", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
    $0.addTarget(self, action: #selector(touchBackButton(_:)), for: .touchUpInside)
    $0.isUserInteractionEnabled = true
  }
  
  private let deleteAccountButton = UIButton().then {
    $0.setupButton(title: "그래도 탈퇴하기", color: .hackerBlue, font: .btnText(ofSize: 18), backgroundColor: .clear, state: .normal, radius: 0)
    $0.setUnderline()
    $0.addTarget(self, action: #selector(touchDeleteAccountButton(_:)), for: .touchUpInside)
    $0.isUserInteractionEnabled = true
  }
  
  private let tearDropView = UIView().then {
    $0.backgroundColor = .hackerBlue
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    setupAutoLayout()
    tearViewAnimation()
  }
  
  // MARK: - Custom Method
  
  private func configUI() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
  }
  
  private func setupAutoLayout() {
    view.addSubviews([navigationBar, goodbyeLabel,
                      cryingManImageView, tearDropView,
                      deleteAccountButton, backButton])
    navigationBar.iconLayout(isBack: true, logoImage: nil, rightImage: nil)
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
    goodbyeLabel.snp.makeConstraints { make in
      make.top.equalTo(self.navigationBar.snp.bottom).offset(9)
      make.leading.equalToSuperview().inset(24)
    }
    cryingManImageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.greaterThanOrEqualToSuperview()
      make.top.lessThanOrEqualTo(goodbyeLabel.snp.bottom).offset(UIScreen.main.hasNotch ? 97 : 50)
    }
    tearDropView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.height.equalTo(42)
    }
    deleteAccountButton.snp.makeConstraints { make in
      make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
      make.centerX.equalToSuperview()
    }
    backButton.snp.makeConstraints { make in
      make.bottom.equalTo(self.deleteAccountButton.snp.top).offset(-12)
      make.leading.equalToSuperview().inset(24)
      make.centerX.equalToSuperview()
    }
  }
  
  private func tearViewAnimation() {
    
    var tearMaxHeight: CGFloat = 0
    if UIScreen.main.hasNotch {
      tearMaxHeight = 80
    } else {
      tearMaxHeight = 40
    }
    
    UIView.animate(withDuration: 3.0,
                   delay: 0.1,
                   options: .curveEaseInOut,
                   animations: {
      self.tearDropView.snp.updateConstraints { make in
        make.height.equalTo(tearMaxHeight)
      }
      self.tearDropView.frame = CGRect(x: self.tearDropView.frame.origin.x,
                                       y: -tearMaxHeight,
                                       width: self.tearDropView.frame.width,
                                       height: tearMaxHeight)
    }) { _ in
      UIView.animate(withDuration: 1.5,
                     delay: 0,
                     options: [.autoreverse, .repeat],
                     animations: {
        self.tearDropView.frame = CGRect(x: self.tearDropView.frame.origin.x,
                                         y: self.tearDropView.frame.origin.y + 30,
                                         width: self.tearDropView.frame.width,
                                         height: tearMaxHeight)
      })
    }
  }
  
  // MARK: - @objc
  
  @objc func touchBackButton(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  
  @objc func touchDeleteAccountButton(_ sender: UIButton) {
    print("deleteAccountButton")
    deleteAccountWithAPI()
  }
}

// MARK: - Network
extension DeleteAccountViewController {
  func deleteAccountWithAPI() {
    LoadingHUD.show()
    SettingAPI.shared.deleteAccount() { response in
      LoadingHUD.hide()
      switch response {
      case .success(let message):
        print("deleteAccountWithAPI - success: \(message)")
        UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.accessToken)
        UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.refreshToken)
        UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.nickname)
        UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.userID)
        UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.username)
        UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.isAppleLogin)
        UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.appleUserCredentialId)
        let loginVC = LoginViewController()
        self.changeRootViewController(loginVC)
      case .requestErr(let message):
        print("deleteAccountWithAPI - requestErr: \(message)")
      case .pathErr:
        print("deleteAccountWithAPI - pathErr")
      case .serverErr:
        print("deleteAccountWithAPI - serverErr")
      case .networkFail:
        print("deleteAccountWithAPI - networkFail")
      default:
        print("default!")
      }
    }
  }
}
