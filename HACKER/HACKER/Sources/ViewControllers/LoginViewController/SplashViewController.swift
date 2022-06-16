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
    getStoreVersion()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
      if self.appDelegate?.isLogin == true {
        self.presentToMain()
      } else {
        self.presentToLogin()
      }
    }
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
  
  func getStoreVersion() {
    currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""

    let key = "min_version"
    let value = "0.0"
    
    var remoteConfig = RemoteConfig.remoteConfig()
    var settings = RemoteConfigSettings()
    settings.minimumFetchInterval = 0
    remoteConfig.configSettings = settings
    
    // [해당 키값이 없을 경우 디폴트 값 삽입]
    let defaultDic: NSDictionary = ["\(key)":"\(value)"]
    remoteConfig.setDefaults(defaultDic as? [String : NSObject])
    
    remoteConfig.fetch { (status, error) -> Void in
      if status == .success {
        remoteConfig.activate { changed, error in
          self.appStoreVersion = remoteConfig.configValue(forKey: "\(key)").stringValue ?? ""
          print(remoteConfig.configValue(forKey: "\(key)").stringValue ?? "")
          print(self.appStoreVersion)
          self.needUpdated()
        }
      }
    }
  }
  
  func needUpdate() -> Bool {
    let nowVersionArr = currentVersion.split(separator: ".").map { $0 }
    let storeVersionArr = appStoreVersion.split(separator: ".").map { $0 }
    
    print("nowVersionArr", nowVersionArr)
    print("newVersionArr", storeVersionArr)
    
//    if nowVersionArr[0] != storeVersionArr[0] {
//      return true
//    }
//    else if nowVersionArr[1] != storeVersionArr[1] {
//      return true
//    }
//    else if nowVersionArr[2] != storeVersionArr[2] {
//      return true
//    }
//    else {
//      return false
//    }
    
    return true
  }
  func needUpdated() {
    let nowVersionArr = currentVersion.split(separator: ".").map { $0 }
    let storeVersionArr = appStoreVersion.split(separator: ".").map { $0 }
    
    print("nowVersionArr", nowVersionArr)
    print("newVersionArr", storeVersionArr)
    
  }
  func presentUpdateAlert() {
    if needUpdate() {
      // 업데이트 필요한 경우
      print("yes")
//      let popupViewController = VersionUpdatePopupVC()
//      popupViewController.modalTransitionStyle = .crossDissolve
//      popupViewController.modalPresentationStyle = .overCurrentContext
//      self.present(popupViewController, animated: true, completion: nil)
    } else {
      // 업데이트 필요하지 않은 경우
      print("no")
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
        let loginNVC = UINavigationController(rootViewController: LoginViewController())
        
        if UserDefaults.standard.value(forKey: Const.UserDefaultsKey.accessToken) != nil && UserDefaults.standard.value(forKey: Const.UserDefaultsKey.refreshToken) != nil{
          self.changeRootViewController(TabBarViewController())
        }
        else {
          self.changeRootViewController(loginNVC)
        }
      }
    }
  }
}
