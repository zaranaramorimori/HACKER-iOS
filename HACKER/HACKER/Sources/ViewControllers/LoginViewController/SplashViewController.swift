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
          print("")
          print("===============================")
          print("[AppDelegate >> checkUpdateMobileVersion]")
          print("설명 :: 파이어베이스 리모트 앱 최신 버전 체크 성공")
          print("version :: \(remoteConfig.configValue(forKey: "\(key)").stringValue ?? "")")
          print("===============================")
          print("")
        }
      }
      else {
        print("")
        print("===============================")
        print("[AppDelegate >> checkUpdateMobileVersion]")
        print("설명 :: 파이어베이스 리모트 앱 최신 버전 체크 에러")
        print("error :: \(error?.localizedDescription)")
        print("===============================")
        print("")
      }
    }
  }
}
