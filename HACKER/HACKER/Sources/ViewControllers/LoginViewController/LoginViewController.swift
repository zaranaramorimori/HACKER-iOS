//
//  LoginViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/02/20.
//

import UIKit

import SnapKit
import Then

// MARK: - LoginViewController
class LoginViewController: UIViewController {
  
  // MARK: - Components
  let logoImageView = UIImageView()
  let hackerLetter = UIImageView()
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .hackerWhite
    layout()
  }
}
// MARK: - Extensions
extension LoginViewController {
  func layout() {
    layoutLogoImageView()
    layoutHackerLetter()
  }
  func layoutLogoImageView() {
    self.view.add(logoImageView) {
      $0.image = UIImage(named: "200")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(106)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(200)
        $0.height.equalTo(200)
      }
    }
  }
  func layoutHackerLetter() {
    self.view.add(hackerLetter) {
      $0.image = UIImage(named: "hackerLetter")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.logoImageView.snp.bottom).offset(28)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(253)
        $0.height.equalTo(101)
      }
    }
  }
}
