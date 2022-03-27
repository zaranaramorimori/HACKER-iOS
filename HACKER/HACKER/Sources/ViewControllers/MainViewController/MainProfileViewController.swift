//
//  MainProfileViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/18.
//

import UIKit

import SnapKit
import Then

// MARK: - MainProfileViewController
class MainProfileViewController: UIViewController {
  
  // MARK: - Components
  let backButton = UIButton()
  let userCharacterImage = UIImageView()
  let userHairImage = UIImageView()
  let userNicknameLabel = UILabel()
  let userGithubNameLabel = UILabel()
  let hairNumLabel = UILabel()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
  }
}
// MARK: - Extensions
extension MainProfileViewController {
  func setBackground() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
    self.tabBarController?.tabBar.isHidden = true
  }
  func layout() {
    layoutBackButton()
    layoutUserCharacterImage()
    layoutUserHairImage()
    layoutUserNickNameLabel()
    layoutUserGithubNameLabel()
    layoutHairNumLabel()
  }
  func layoutBackButton() {
    view.add(backButton) {
      $0.setImage(UIImage(named: "backButtonIcon"), for: .normal)
      $0.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
        $0.leading.equalToSuperview().offset(24)
        $0.width.equalTo(40)
        $0.height.equalTo(40)
      }
    }
  }
  func layoutUserCharacterImage() {
    view.add(userCharacterImage) {
      $0.image = UIImage(named: "userCharacterImage")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.backButton.snp.bottom).offset(77)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserHairImage() {
    view.add(userHairImage) {
      $0.image = UIImage(named: "sampleHairImage")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserNickNameLabel() {
    view.add(userNicknameLabel) {
      $0.setupLabel(text: "훈세", color: .hackerBlack, font: .titleBold(ofSize: 24))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.bottom).offset(20)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutUserGithubNameLabel() {
    view.add(userGithubNameLabel) {
      $0.setupLabel(text: "devkwonsehoon", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userNicknameLabel.snp.bottom).offset(8)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutHairNumLabel() {
    view.add(hairNumLabel) {
      $0.setupLabel(text: "360가닥", color: .hackerBlack, font: .btnText(ofSize: 40))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userGithubNameLabel.snp.bottom).offset(26)
        $0.centerX.equalToSuperview()
      }
    }
  }
  @objc func backButtonTapped() {
    self.navigationController?.popViewController(animated: false)
  }
}
