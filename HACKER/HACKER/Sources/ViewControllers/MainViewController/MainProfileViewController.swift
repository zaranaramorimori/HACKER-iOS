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
  let userhairfirstImage = UIImageView()
  let userhairsecondImage = UIImageView()
  let userhairthirdImage = UIImageView()
  let userhairfourthImage = UIImageView()
  let userhairfifthImage = UIImageView()
  let userhairsixthImage = UIImageView()
  let userhairseventhImage = UIImageView()
  let userhaireighthImage = UIImageView()
  let userhairninethImage = UIImageView()
  let userhairtenthImage = UIImageView()
  let userhaireleventhImage = UIImageView()
  let userhairtwelvethImage = UIImageView()
  let userNicknameLabel = UILabel()
  let userGithubNameLabel = UILabel()
  let hairNumLabel = UILabel()
  
  var hairNumber = 0
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
    userDetailInfoWithAPI()
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
    layoutUserFirstHairImage()
    layoutUserSecondHairImage()
    layoutUserthirdHairImage()
    layoutUserFourthHairImage()
    layoutUserFifthHairImage()
    layoutUserSixthHairImage()
    layoutUserSeventhHairImage()
    layoutUserEighthHairImage()
    layoutUserNinethHairImage()
    layoutUserTenthHairImage()
    layoutUserEleventhHairImage()
    layoutUserTwelvethHairImage()
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
  func layoutUserFirstHairImage() {
    view.add(userhairfirstImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserSecondHairImage() {
    view.add(userhairsecondImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserthirdHairImage() {
    view.add(userhairthirdImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserFourthHairImage() {
    view.add(userhairfourthImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserFifthHairImage() {
    view.add(userhairfifthImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserSixthHairImage() {
    view.add(userhairsixthImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserSeventhHairImage() {
    view.add(userhairseventhImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserEighthHairImage() {
    view.add(userhaireighthImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserNinethHairImage() {
    view.add(userhairninethImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserTenthHairImage() {
    view.add(userhairtenthImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserEleventhHairImage() {
    view.add(userhaireleventhImage) {
      $0.image = UIImage(named: "")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserTwelvethHairImage() {
    view.add(userhairtwelvethImage) {
      $0.image = UIImage(named: "")
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
      $0.setupLabel(text: "\(self.hairNumber)가닥", color: .hackerBlack, font: .btnText(ofSize: 40))
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

// MARK: - Network
extension MainProfileViewController {
  func userDetailInfoWithAPI() {
    MainAPI.shared.userDetailInfo { response in
      switch response {
      case .success(let data):
        if let userDetailInfo = data as? MainDetailResponse {
          self.userhairfirstImage.updateServerImage(userDetailInfo.head.one ?? "")
          self.userhairsecondImage.updateServerImage(userDetailInfo.head.two ?? "")
          self.userhairthirdImage.updateServerImage(userDetailInfo.head.three ?? "")
          self.userhairfourthImage.updateServerImage(userDetailInfo.head.four ?? "")
          self.userhairfifthImage.updateServerImage(userDetailInfo.head.five ?? "")
          self.userhairsixthImage.updateServerImage(userDetailInfo.head.six ?? "")
          self.userhairseventhImage.updateServerImage(userDetailInfo.head.seven ?? "")
          self.userhaireighthImage.updateServerImage(userDetailInfo.head.eight ?? "")
          self.userhairninethImage.updateServerImage(userDetailInfo.head.nine ?? "")
          self.userhairtenthImage.updateServerImage(userDetailInfo.head.ten ?? "")
          self.userhaireleventhImage.updateServerImage(userDetailInfo.head.eleven ?? "")
          self.userhairtwelvethImage.updateServerImage(userDetailInfo.head.twelve ?? "")
          self.userNicknameLabel.text = userDetailInfo.user.nickname
          self.userGithubNameLabel.text = userDetailInfo.user.username
          self.hairNumber = userDetailInfo.user.hairCount
        }
      case .requestErr(let status):
        print("userNicknameWithAPI - requestErr: \(status)")
      case .pathErr:
        print("userNicknameWithAPI - pathErr")
      case .serverErr:
        print("userNicknameWithAPI - serverErr")
      case .networkFail:
        print("userNicknameWithAPI - networkFail")
      }
    }
  }
}
