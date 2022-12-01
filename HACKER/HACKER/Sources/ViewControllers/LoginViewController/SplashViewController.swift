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
  
  private func presentToOnboarding() {
    let loginVC = OnboardingViewController()
    loginVC.modalPresentationStyle = .fullScreen
    loginVC.modalTransitionStyle = .crossDissolve
    self.present(loginVC, animated: true, completion: nil)
  }
  
  private func presentToLogin() {
    let loginVC = LoginViewController()
    loginVC.modalPresentationStyle = .fullScreen
    loginVC.modalTransitionStyle = .crossDissolve
    self.present(loginVC, animated: true, completion: nil)
  }
  
  func setApplicationIconName(_ iconName: String?) {
    if UIApplication.shared.responds(to: #selector(getter: UIApplication.supportsAlternateIcons)) && UIApplication.shared.supportsAlternateIcons {
      
      typealias SetAlternateIconName = @convention(c) (NSObject, Selector, NSString?, @escaping (NSError) -> ()) -> ()
      
      let selectorString = "_setAlternateIconName:completionHandler:"
      
      let selector = NSSelectorFromString(selectorString)
      let imp = UIApplication.shared.method(for: selector)
      let method = unsafeBitCast(imp, to: SetAlternateIconName.self)
      method(UIApplication.shared, selector, iconName as NSString?, { _ in })
    }
  }
  
  private func changeAppIcon() {
    print(Date())
    let formatter = DateFormatter()
    formatter.dateFormat = "MM"
    let currentMonth = formatter.string(from: Date())
    print(currentMonth)
    
    if currentMonth == "12" || currentMonth == "01" {
      UIApplication.shared.setAlternateIconName("Winter") { error in
        guard error == nil else {
          print(error?.localizedDescription)
          return
        }
        print("Winter icon updated")
      }
      //setApplicationIconName("AppIcon-Winter")
    } else {
      UIApplication.shared.setAlternateIconName(nil) { error in
        guard error == nil else {
          print(error?.localizedDescription)
          return
        }
        print("Default icon updated")
      }
     // setApplicationIconName(nil)
    }
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
    else if nowVersionArr[2] < storeVersionArr[2] {
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
//      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//        if self.appDelegate?.isLogin == true {
//          self.presentToMain()
//        } else {
//          if UserDefaults.standard.bool(forKey: Const.UserDefaultsKey.isOnboarding) {
//            self.presentToLogin()
//          } else {
//            self.presentToOnboarding()
//          }
//        }
//      }
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
        //self.changeAppIcon()
        if UserDefaults.standard.bool(forKey: Const.UserDefaultsKey.isOnboarding) {
          if self.appDelegate?.isLogin == true {
            self.presentToMain()
          } else {
            self.presentToLogin()
          }
        } else {
          self.presentToOnboarding()
        }
      }
    }
  }
}
