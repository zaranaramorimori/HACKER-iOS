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
  let todayCommitLabel = UILabel()
  let todayCommitNumLabel = UILabel()
  let refreshButton = UIButton()
  let progressBackgroundView = UIView()
  let progressFrontView = UIView()
  let attackContainerView = UIStackView()
  let attackTicket = UIImageView()
  let attackNum = UILabel()
  let attackCouponButton = UIButton()
  
  var userNickName = ""
  var todayCommitNumber = 0
  var attackNumber = 0
  var availableCouponNumber = 0
  let screenWidth = UIScreen.main.bounds.width-48
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackgrund()
    layout()
    setImageViewTap()
    userInfoWithAPI()
  }
  override func viewWillAppear(_ animated: Bool) {
    self.tabBarController?.tabBar.isHidden = false
  }
}
// MARK: - Extension
extension MainViewController {
  func setBackgrund() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
  }
  func setImageViewTap() {
    self.navigationController?.navigationBar.isHidden = true
    /// 이미지뷰 클릭시 상세 프로필화면으로
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.userCharacterViewTapped))
    tapGestureRecognizer.isEnabled = true
    tapGestureRecognizer.numberOfTapsRequired = 1
    /// 이미지뷰는 터치가 원래 안되니까 터치 가능하도록
    self.userCharacterImage.isUserInteractionEnabled = true
    self.userCharacterImage.addGestureRecognizer(tapGestureRecognizer)
  }
  func layout() {
    layoutNickNameLabel()
    layoutAlarmButton()
    layoutSettingsButton()
    layoutUserCharacterImage()
    layoutUserHairFirstImage()
    layoutUserHairSecondImage()
    layoutUserHairThirdImage()
    layoutUserHairfourthImage()
    layoutUserHairFifthImage()
    layoutUserHairsixthImage()
    layoutUserHairseventhImage()
    layoutUserHaireighthImage()
    layoutUserHairninethImage()
    layoutUserHairtenthImage()
    layoutUserHaireleventhImage()
    layoutUserHairtwelvethImage()
    layoutTodayCommitLabel()
    layoutTodayCommitNumLabel()
    layoutRefreshButton()
    layoutProgressBackgroundView()
    layoutProgressFrontView()
    layoutAttackContainerView()
    layoutAttackTicket()
    layoutAttackNum()
    layoutAttackCouponButton()
  }
  func layoutNickNameLabel() {
    view.add(nicknameLabel) {
      $0.setupLabel(text: "\(self.userNickName) 님\n오늘도 커밋하세요!",
                    color: .hackerBlack,
                    font: .subtitleMedium(ofSize: 24))
      /// 훈세, 님 만 굵은 글씨로 변경하기
      let attributedStr = NSMutableAttributedString(string: self.nicknameLabel.text ?? "")
      attributedStr.addAttribute(.font, value: UIFont.titleBold(ofSize: 30), range: (self.nicknameLabel.text! as NSString).range(of: "\(self.userNickName)"))
      attributedStr.addAttribute(.font, value: UIFont.subtitleMedium(ofSize: 30), range: (self.nicknameLabel.text! as NSString).range(of: "님"))
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
      $0.addTarget(self, action: #selector(self.settingButtonTapped), for: .touchUpInside)
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
        $0.height.equalTo(UIScreen.main.bounds.width-48).multipliedBy(1.1)
      }
    }
  }
  func layoutUserHairFirstImage() {
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
  func layoutUserHairSecondImage() {
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
  func layoutUserHairThirdImage() {
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
  func layoutUserHairfourthImage() {
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
  func layoutUserHairFifthImage() {
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
  func layoutUserHairsixthImage() {
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
  func layoutUserHairseventhImage() {
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
  func layoutUserHaireighthImage() {
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
  func layoutUserHairninethImage() {
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
  func layoutUserHairtenthImage() {
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
  func layoutUserHaireleventhImage() {
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
  func layoutUserHairtwelvethImage() {
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
  func layoutTodayCommitLabel() {
    view.add(todayCommitLabel) {
      $0.setupLabel(text: "오늘 커밋 횟수", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.bottom).offset(28)
        $0.leading.equalToSuperview().offset(24)
      }
    }
  }
  func layoutTodayCommitNumLabel() {
    view.add(todayCommitNumLabel) {
      $0.setupLabel(text: "(\(self.todayCommitNumber)/10)", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.todayCommitLabel.snp.top)
        $0.leading.equalTo(self.todayCommitLabel.snp.trailing).offset(4)
      }
    }
  }
  func layoutRefreshButton() {
    view.add(refreshButton) {
      $0.setImage(UIImage(named: "refreshblackIcon"), for: .normal)
      $0.addTarget(self, action: #selector(self.refreshButtonTapped), for: .touchUpInside)
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
        $0.height.equalTo(self.screenWidth*0.12)
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
        $0.height.equalTo(self.screenWidth*0.12)
      }
    }
  }
  func layoutAttackContainerView() {
    attackContainerView.alignment = .trailing
    attackContainerView.spacing = 7
    view.add(attackContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.top.equalTo(self.progressBackgroundView.snp.bottom).offset(10)
        $0.trailing.equalToSuperview().offset(-24)
        $0.height.equalTo(35)
      }
    }
  }
  func layoutAttackCouponButton() {
    view.add(attackCouponButton) {
      $0.setupButton(title: "교환하기 (\(self.availableCouponNumber))", color: .hackerWhite, font: .btnText(ofSize: 24), backgroundColor: .clear, state: .normal, radius: 0)
      $0.isHidden = true // TODO: - 지수야 프로그레스바 작업하고 나서 이거 디폴트 true로 바꿔 !
      $0.addTarget(self, action: #selector(self.getAttackCouponTapped), for: .touchUpInside)
      $0.snp.makeConstraints { make in
        make.edges.equalTo(self.progressBackgroundView)
      }
    }
  }
  func layoutAttackTicket() {
    attackContainerView.addArrangedSubview(attackTicket)
    attackTicket.image = UIImage(named: "attackTicketIcon")
  }
  func layoutAttackNum() {
    attackContainerView.addArrangedSubview(attackNum)
    attackNum.setupLabel(text: "x\(self.attackNumber)", color: .hackerBlack, font: .btnText(ofSize: 32))
  }
  func setupLabel() {
    nicknameLabel.setupLabel(text: "\(self.userNickName) 님\n오늘도 커밋하세요!",
                  color: .hackerBlack,
                  font: .subtitleMedium(ofSize: 24))
    /// 훈세, 님 만 굵은 글씨로 변경하기
    let attributedStr = NSMutableAttributedString(string: self.nicknameLabel.text ?? "")
    attributedStr.addAttribute(.font, value: UIFont.titleBold(ofSize: 30), range: (self.nicknameLabel.text! as NSString).range(of: "\(self.userNickName)"))
    attributedStr.addAttribute(.font, value: UIFont.subtitleMedium(ofSize: 30), range: (self.nicknameLabel.text! as NSString).range(of: "님"))
    self.nicknameLabel.attributedText = attributedStr
    
    todayCommitNumLabel.setupLabel(text: "(\(self.todayCommitNumber)/10)", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    attackNum.setupLabel(text: "x\(self.attackNumber)", color: .hackerBlack, font: .btnText(ofSize: 32))
    /// today commit 수에 맞게 progress Bar 분기처리
    if self.todayCommitNumber < 10 {
      progressFrontView.snp.makeConstraints { make in
        make.width.equalTo((Int(self.screenWidth)/10)*self.todayCommitNumber)
      }
    } else {
      progressFrontView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
      progressFrontView.snp.makeConstraints { make in
        make.width.equalTo(self.progressBackgroundView)
      }
      attackCouponButton.isHidden = false
      }
  }
  @objc func userCharacterViewTapped() {
    let mainProfileVC = MainProfileViewController()
    self.navigationController?.pushViewController(mainProfileVC, animated: false)
  }
  @objc func settingButtonTapped() {
    let settingVC = SettingViewController()
    self.navigationController?.pushViewController(settingVC, animated: true)
  }
  @objc private func getAttackCouponTapped() {
    AttackAPI.shared.getAttackCoupon { (response) in
      switch response {
      case .success:
        print("getAttackCoupon - 성공")
        self.attackNumber += 1
      case .requestErr(let msg):
        if let errorMsg = msg as? String {
          self.makeAlertOnlyMessage(message: errorMsg, okAction: nil)
        }
      case .pathErr:
        print("getAttackCoupon - pathErr")
      case .serverErr:
        print("getAttackCoupon - serverErr")
      case .networkFail:
        print("getAttackCoupon - networkFail")
      }
    }
  }
  @objc private func refreshButtonTapped() {
    userInfoWithAPI()
  }
}

// MARK: - Network
extension MainViewController {
  func userInfoWithAPI() {
    MainAPI.shared.userInfo { response in
      switch response {
      case .success(let data):
        if let userInfo = data as? MainResponse {
          self.userhairfirstImage.updateServerImage(userInfo.head.one ?? "")
          self.userhairsecondImage.updateServerImage(userInfo.head.two ?? "")
          self.userhairthirdImage.updateServerImage(userInfo.head.three ?? "")
          self.userhairfourthImage.updateServerImage(userInfo.head.four ?? "")
          self.userhairfifthImage.updateServerImage(userInfo.head.five ?? "")
          self.userhairsixthImage.updateServerImage(userInfo.head.six ?? "")
          self.userhairseventhImage.updateServerImage(userInfo.head.seven ?? "")
          self.userhaireighthImage.updateServerImage(userInfo.head.eight ?? "")
          self.userhairninethImage.updateServerImage(userInfo.head.nine ?? "")
          self.userhairtenthImage.updateServerImage(userInfo.head.ten ?? "")
          self.userhaireleventhImage.updateServerImage(userInfo.head.eleven ?? "")
          self.userhairtwelvethImage.updateServerImage(userInfo.head.twelve ?? "")
          self.userNickName = userInfo.user.nickname
          self.todayCommitNumber = userInfo.coupon.todayCommit
          self.attackNumber = userInfo.coupon.couponCommit
          self.setupLabel()
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
