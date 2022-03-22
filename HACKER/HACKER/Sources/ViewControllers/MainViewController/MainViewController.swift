//
//  MainViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/18.
//

import UIKit

import SnapKit
import Then

// MARK: - MainViewController
class MainViewController: UIViewController {
  
  // MARK: - Components
  let nicknameLabel = UILabel()
  let alarmButton = UIButton()
  let settingsButton = UIButton()
  let userCharacterImage = UIImageView()
  let userhairImage = UIImageView()
  let todayCommitLabel = UILabel()
  let todayCommitNumLabel = UILabel()
  let refreshButton = UIButton()
  let progressBackgroundView = UIView()
  let progressFrontView = UIView()
  let attackContainerView = UIView()
  let attackTicket = UIImageView()
  let attackNum = UILabel()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .hackerWhite
    layout()
    
    /// 이미지뷰 클릭시 상세 프로필화면으로
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.userCharacterViewTapped))
    tapGestureRecognizer.isEnabled = true
    tapGestureRecognizer.numberOfTapsRequired = 1
    /// 이미지뷰는 터치가 원래 안되니까 터치 가능하도록
    self.userCharacterImage.isUserInteractionEnabled = true
    self.userCharacterImage.addGestureRecognizer(tapGestureRecognizer)
  }
}
// MARK: - Extension
extension MainViewController {
  func layout() {
    layoutNickNameLabel()
    layoutAlarmButton()
    layoutSettingsButton()
    layoutUserCharacterImage()
    layoutUserHairImage()
    layoutTodayCommitLabel()
    layoutTodayCommitNumLabel()
    layoutRefreshButton()
    layoutProgressBackgroundView()
    layoutProgressFrontView()
    layoutAttackContainerView()
    layoutAttackTicket()
    layoutAttackNum()
  }
  func layoutNickNameLabel() {
    view.add(nicknameLabel) {
      $0.setupLabel(text: "훈세 님\n오늘도 커밋하세요!",
                    color: .hackerBlack,
                    font: .subtitleMedium24)
      /// 훈세, 님 만 굵은 글씨로 변경하기
      let attributedStr = NSMutableAttributedString(string: self.nicknameLabel.text ?? "")
      attributedStr.addAttribute(.font, value: UIFont.titleBold30, range: (self.nicknameLabel.text! as NSString).range(of: "훈세"))
      attributedStr.addAttribute(.font, value: UIFont.subtitleMedium30, range: (self.nicknameLabel.text! as NSString).range(of: "님"))
      self.nicknameLabel.attributedText = attributedStr
      $0.numberOfLines = 2
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(31)
        $0.leading.equalToSuperview().offset(24)
      }
    }
  }
  func layoutAlarmButton() {
    view.add(alarmButton) {
      $0.setImage(UIImage(named: "alarmIcon"), for: .normal)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.nicknameLabel.snp.top)
        $0.trailing.equalToSuperview().offset(-24)
        $0.width.equalTo(40)
        $0.height.equalTo(40)
      }
    }
  }
  func layoutSettingsButton() {
    view.add(settingsButton) {
      $0.setImage(UIImage(named: "settingsIcon"), for: .normal)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.alarmButton.snp.bottom).offset(13)
        $0.trailing.equalTo(self.alarmButton.snp.trailing)
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
        $0.top.equalTo(self.settingsButton.snp.bottom).offset(13)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo((UIScreen.main.bounds.width-48)*1.1)
      }
    }
  }
  func layoutUserHairImage() {
    view.add(userhairImage) {
      $0.image = UIImage(named: "sampleHairImage")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.top)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo((UIScreen.main.bounds.width-48)*1.1)
      }
    }
  }
  func layoutTodayCommitLabel() {
    view.add(todayCommitLabel) {
      $0.setupLabel(text: "오늘 커밋 횟수", color: .hackerBlack, font: .subtitleMedium16)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.bottom).offset(28)
        $0.leading.equalToSuperview().offset(24)
      }
    }
  }
  func layoutTodayCommitNumLabel() {
    view.add(todayCommitNumLabel) {
      $0.setupLabel(text: "(9/10)", color: .hackerBlack, font: .subtitleMedium16)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.todayCommitLabel.snp.top)
        $0.leading.equalTo(self.todayCommitLabel.snp.trailing).offset(4)
      }
    }
  }
  func layoutRefreshButton() {
    view.add(refreshButton) {
      $0.setImage(UIImage(named: "refreshblackIcon"), for: .normal)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.bottom).offset(18)
        $0.trailing.equalToSuperview().offset(-24)
        $0.width.equalTo(37)
        $0.height.equalTo(37)
      }
    }
  }
  func layoutProgressBackgroundView() {
    view.add(progressBackgroundView) {
      $0.backgroundColor = .hackerWhite
      $0.setBorder(borderColor: .hackerBlack, borderWidth: 3)
      $0.setRounded(radius: 10)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.refreshButton.snp.bottom).offset(5)
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo((UIScreen.main.bounds.width-48)*0.12)
      }
    }
  }
  func layoutProgressFrontView() {
    view.add(progressFrontView) {
      $0.backgroundColor = .hackerBlack
      $0.layer.cornerRadius = 10
      $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
      $0.snp.makeConstraints {
        $0.top.equalTo(self.progressBackgroundView.snp.top)
        $0.leading.equalToSuperview().offset(24)
        $0.trailing.equalToSuperview().offset(-(UIScreen.main.bounds.width/10)*3)
        $0.height.equalTo((UIScreen.main.bounds.width-48)*0.12)
      }
    }
  }
  func layoutAttackContainerView() {
    view.add(attackContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.top.equalTo(self.progressBackgroundView.snp.bottom).offset(10)
        $0.trailing.equalToSuperview().offset(-24)
        $0.width.equalTo(106)
        $0.height.equalTo(35)
      }
    }
  }
  func layoutAttackTicket() {
    attackContainerView.add(attackTicket) {
      $0.image = UIImage(named: "attackTicketIcon")
      $0.snp.makeConstraints {
        $0.top.leading.bottom.equalToSuperview()
        $0.width.equalTo(72)
        $0.height.equalTo(35)
      }
    }
  }
  func layoutAttackNum() {
    attackContainerView.add(attackNum) {
      $0.setupLabel(text: "x1", color: .hackerBlack, font: .btnText32)
      $0.snp.makeConstraints {
        $0.trailing.equalToSuperview()
        $0.centerY.equalToSuperview()
      }
    }
  }
  @objc func userCharacterViewTapped() {
    let mainProfileVC = MainProfileViewController()
    self.navigationController?.pushViewController(mainProfileVC, animated: false)
  }
}
