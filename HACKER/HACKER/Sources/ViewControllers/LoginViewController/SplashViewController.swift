//
//  SplashViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/02/20.
//

import UIKit

import SnapKit
import Then
import Firebase
import FirebaseRemoteConfig

// MARK: - SplashViewController
class SplashViewController: UIViewController {
  
  // MARK: - Components
  let logoImageView = UIImageView()
  
  // MARK: - Properties
  private weak var appDelegate = UIApplication.shared.delegate as? AppDelegate
  let defaults = UserDefaults.standard
  var currentVersion = ""
  var appStoreVersion = ""
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
    DispatchQueue.main.async {
      self.presentUpdateAlert()
    }
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
//    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//      if self.appDelegate?.isLogin == true {
//        self.presentToMain()
//      } else {
//        self.presentToLogin()
//      }
//    }
  }
}

// MARK: - Extensions
extension SplashViewController {
  func setBackground() {
    self.view.backgroundColor = .hackerWhite
  }
  func layout() {
    layoutLogoImageView()
  }
  func layoutLogoImageView() {
    self.view.add(logoImageView) {
      $0.image = UIImage(named: "200")
      $0.snp.makeConstraints {
        $0.top.equalToSuperview().offset(246)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(200)
        $0.height.equalTo(200)
      }
    }
  }
  // MARK: - Functions
  private func presentToMain() {
    let tabbarVC = TabBarViewController()
    self.changeRootViewController(tabbarVC)
  }
  
  private func presentToLogin() {
    let loginVC = LoginViewController()
    loginVC.modalPresentationStyle = .fullScreen
    loginVC.modalTransitionStyle = .crossDissolve
    self.present(loginVC, animated: true, completion: nil)
  }
  
  func needUpdate() -> Bool {
    
    guard
      let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
      let url = URL(string: "https://itunes.apple.com/lookup?bundleId=\(Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? "")"),
      let data = try? Data(contentsOf: url),
      let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
      let results = json["results"] as? [[String: Any]],
      !results.isEmpty,
      let appStoreVersion = results[0]["version"] as? String
        
    else { return false }
    
    let nowVersionArr = version.split(separator: ".").map { $0 }
    let storeVersionArr = appStoreVersion.split(separator: ".").map { $0 }
    
    print("nowVersionArr", nowVersionArr)
    print("newVersionArr", storeVersionArr)
    
    if nowVersionArr[0] != storeVersionArr[0] {
      return true
    }
    else if nowVersionArr[1] != storeVersionArr[1] {
      return true
    }
    else if nowVersionArr[2] != storeVersionArr[2] {
      return true
    }
    else {
      return false
    }
  }
  
  func presentUpdateAlert() {
    if needUpdate() {
      // 업데이트 필요한 경우
      // 이후 아래는 커스텀 팝업으로 변경
      self.makeAlertOnlyMessage(message: "앱을 이용하기 위해서는 업데이트가 필요합니다.",
                                okAction: { _ in
        guard let url = URL(string: "itms-apps://itunes.apple.com/app/1627056721") else { return }
        if UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
        }
      })
    } else {
      // 업데이트 필요하지 않은 경우
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
        if self.appDelegate?.isLogin == true {
          self.presentToMain()
        } else {
          self.presentToLogin()
        }
      }
    }
  }
}
