//
//  SplashViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/02/20.
//

import UIKit

import SnapKit
import Then

// MARK: - SplashViewController
class SplashViewController: UIViewController {
  
  // MARK: - Components
  let logoImageView = UIImageView()
  
  // MARK: - Properties
  private weak var appDelegate = UIApplication.shared.delegate as? AppDelegate
  let defaults = UserDefaults.standard
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
      if self.appDelegate?.isLogin == true {
        self.presentToMain()
      } else {
        self.presentToSignup()
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
    let mainVC = MainViewController()
    mainVC.modalPresentationStyle = .fullScreen
    mainVC.modalTransitionStyle = .crossDissolve
    self.present(mainVC, animated: true, completion: nil)
  }
  
  private func presentToSignup() {
    let signupVC = SignupViewController()
    signupVC.modalPresentationStyle = .fullScreen
    signupVC.modalTransitionStyle = .crossDissolve
    self.present(signupVC, animated: true, completion: nil)
  }
}
