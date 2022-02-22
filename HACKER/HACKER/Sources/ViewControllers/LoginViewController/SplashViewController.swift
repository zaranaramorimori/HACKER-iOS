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
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .hackerWhite
    layout()
  }
}
// MARK: - Extensions
extension SplashViewController {
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
}

