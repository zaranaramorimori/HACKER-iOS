//
//  LoginViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/02/20.
//

import UIKit

import SnapKit
import Then
import AuthenticationServices

// MARK: - LoginViewController
class LoginViewController: UIViewController {
  
  // MARK: - Components
  let logoImageView = UIImageView()
  let hackerLetter = UIImageView()
  let appleloginBar = UIButton()
  let appleloginIcon = UIButton()
  let appleloginexplainLabel = UILabel()
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
    setUI()
  }
}
// MARK: - Extensions
extension LoginViewController {
  func setBackground() {
      self.view.backgroundColor = .hackerWhite
  }
  func layout() {
    layoutLogoImageView()
    layoutHackerLetter()
  }
  func layoutLogoImageView() {
    self.view.add(logoImageView) {
      $0.image = UIImage(named: "200")
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(106)
        make.centerX.equalToSuperview()
        make.width.equalTo(200)
        make.height.equalTo(200)
      }
    }
  }
  func layoutHackerLetter() {
    self.view.add(hackerLetter) {
      $0.image = UIImage(named: "hackerLetter")
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.logoImageView.snp.bottom).offset(28)
        make.centerX.equalToSuperview()
        make.width.equalTo(253)
        make.height.equalTo(101)
      }
    }
  }
  func setUI() {
    let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
      authorizationButton.addTarget(self, action: #selector(appleSignInButtonPress), for: .touchUpInside)
      view.add(authorizationButton) {
          authorizationButton.translatesAutoresizingMaskIntoConstraints = false
          $0.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-51)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(50)
          }
      }
  }
  @objc
  func appleSignInButtonPress() {
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      
      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
  }
  func presentToMain() {
    let signupVC = UINavigationController(rootViewController: SignupViewController())
    signupVC.modalPresentationStyle = .fullScreen
    signupVC.modalTransitionStyle = .crossDissolve
      self.present(signupVC, animated: true) {
        UserDefaults.standard.set(false, forKey: Const.UserDefaultsKey.username)
      }
  }
}

// MARK: - Extension AppleSignIn
extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
      return self.view.window!
  }
  
  // Apple ID 연동 성공 시
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    print("애플로그인 되는중")
      switch authorization.credential {
          //      Apple ID
      case let appleIDCredential as ASAuthorizationAppleIDCredential:
          let userToken = String(data: appleIDCredential.identityToken!, encoding: .utf8) ?? ""
          let userIdentifier = appleIDCredential.user
          loginWithAPI(social: "apple")
          //userToken은 어디로 넣어줘야되지
        print(userToken)
          UserDefaults.standard.set(userIdentifier, forKey: Const.UserDefaultsKey.username)
      default:
          break
      }
  }
  
  // Apple ID 연동 실패 시
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
      // Handle error.
  }
}

// MARK: - Network
extension LoginViewController {
  func loginWithAPI(social: String) {
      LoginAPI.shared.login(social: social) { response in
          switch response {
          case .success(let loginData):
              if let userData = loginData as? LoginResponse {
                  print("loginWithAPI - success")
                  UserDefaults.standard.set(userData.accessToken, forKey: Const.UserDefaultsKey.accessToken)
                  UserDefaults.standard.set(userData.refreshToken, forKey: Const.UserDefaultsKey.refreshToken)
                  self.presentToMain()
              }
          case .requestErr(let message):
              print("loginWithAPI - requestErr: \(message)")
          case .pathErr:
              print("loginWithAPI - pathErr")
          case .serverErr:
              print("loginWithAPI - serverErr")
          case .networkFail:
              print("loginWithAPI - networkFail")
          }
      }
  }
}
