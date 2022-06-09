//
//  AddFriendViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/26.
//

import UIKit

import SnapKit
import Then

// MARK: - AddFriendViewController
class FriendDetailViewController: UIViewController {
  
  // MARK: - Components
  let backButton = UIButton()
  let quitUserButton = UIButton()
  let userCharacterImage = UIImageView()
  let userhairfirstImage = UIImageView()
  let userNicknameLabel = UILabel()
  let userGithubNameLabel = UILabel()
  let hairNumLabel = UILabel()
  let attackButton = UIButton()
  
  var getuserID: Int?
  var isMyFriend: Bool = true
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
  }
}
// MARK: - Extensions
extension FriendDetailViewController {
  func setBackground() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
    self.tabBarController?.tabBar.isHidden = true
  }
  func layout() {
    layoutBackButton()
    layoutAddUserButton()
    layoutUserCharacterImage()
    layoutUserFirstHairImage()
    layoutUserNickNameLabel()
    layoutUserGithubNameLabel()
    layoutHairNumLabel()
    layoutAttackButton()
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
  func layoutAddUserButton() {
    view.add(quitUserButton) {
      if self.isMyFriend {
        $0.setImage(UIImage(named: "userAddedIcon"), for: .normal)
      } else {
        $0.setImage(UIImage(named: "addFriend"), for: .normal)
      }
      $0.addTarget(self, action: #selector(self.quituserButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints { make in
        make.centerY.equalTo(self.backButton)
        make.trailing.equalToSuperview().offset(-24)
        make.width.equalTo(66)
        make.height.equalTo(38)
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
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userCharacterImage.snp.bottom).offset(20)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutUserGithubNameLabel() {
    view.add(userGithubNameLabel) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userNicknameLabel.snp.bottom).offset(8)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutHairNumLabel() {
    view.add(hairNumLabel) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userGithubNameLabel.snp.bottom).offset(38)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutAttackButton() {
    view.add(attackButton) {
      $0.setBackgroundImage(UIImage(named: "yesnoButton"), for: .normal)
      $0.contentMode = .scaleAspectFit
      $0.setupButton(title: "공격하기", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
      $0.addTarget(self, action: #selector(self.attackButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.top.equalTo(self.hairNumLabel.snp.bottom).offset(8)
        make.width.equalTo(181)
        make.height.equalTo(54)
      }
    }
  }
  @objc func backButtonTapped() {
    self.navigationController?.popViewController(animated: false)
  }
  @objc func quituserButtonClicked() {
    // 친구 취소 버튼 클릭 시
    if let id = getuserID {
      LoadingHUD.show()
      FriendAPI.shared.addFriend(requestBody: AddFriendRequest(friendId: id)) { (response) in
        LoadingHUD.hide()
        switch response {
        case .success(let data):
          if let userGithubInfo = data as? AddFriendResponse {
            if userGithubInfo.isFriend {
              self.quitUserButton.setImage(UIImage(named: "userAddedIcon"), for: .normal)
            } else {
              self.quitUserButton.setImage(UIImage(named: "addFriend"), for: .normal)
            }
          }
        case .requestErr(let status):
          if let statusCode = status as? Int {
            switch statusCode {
            case 400 :
              print("[ERR] 필요한 값이 없습니다.")
            default :
              break
            }
          }
          
        case .pathErr:
          print("addFriendAPI - pathErr")
        case .serverErr:
          print("addFriendAPI - serverErr")
        case .networkFail:
          print("addFriendAPI - networkFail")
        }
      }
    }
  }
  @objc func attackButtonClicked(userID: Int) {
    LoadingHUD.show()
    AttackAPI.shared.attackUser(userId: getuserID ?? 0) { (response) in
      LoadingHUD.hide()
      switch response {
      case .success:
        let lottieVC = AttackLottieViewController()
        lottieVC.attackType = .attacker
        lottieVC.modalPresentationStyle = .overCurrentContext
        self.present(lottieVC, animated: false)
      case .requestErr(let msg):
        if let errorMsg = msg as? String {
          self.makeAlertOnlyMessage(message: errorMsg, okAction: nil)
        }
      case .pathErr:
        print("attackUser - pathErr")
      case .serverErr:
        print("attackUser - serverErr")
      case .networkFail:
        print("attackUser - networkFail")
      }
    }
  }
}
