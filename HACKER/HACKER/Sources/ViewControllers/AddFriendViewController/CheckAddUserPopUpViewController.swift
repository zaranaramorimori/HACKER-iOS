//
//  CheckAddUserPopUpViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/08.
//

import UIKit

import SnapKit

// MARK: - CheckAddUserPopUpViewController
class CheckAddUserPopUpViewController: UIViewController {

  // MARK: - Properties
  var parentVC: UIViewController?
  var friendId: Int?
  var username: String?
  
  // MARK: - Components
  let backgroundView = UIView()
  let rectangleBackgroundView = UIView()
  let userImageView = UIImageView()
  let userNameLine = UIImageView()
  let userNameLabel = UILabel()
  let checkLabel = UILabel()
  let buttonContainerView = UIView()
  let yesButton = UIButton()
  let noButton = UIButton()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
  }
}
// MARK: - Extensions
extension CheckAddUserPopUpViewController {
  func setBackground() {
//    self.view.backgroundColor = .hackerWhite
  }
  func layout() {
    layoutBackGroundView()
    layoutRectangleBackgroundView()
    layoutUserImageView()
    layoutUserNameLine()
    layoutUserNameLabel()
    layoutCheckLabel()
    layoutButtonContainerView()
    layoutYesButton()
    layoutNoButton()
  }
  func layoutBackGroundView() {
    self.view.add(backgroundView) {
      $0.backgroundColor = .hackerBackgroundBlack
      $0.snp.makeConstraints {
        $0.top.leading.trailing.bottom.equalToSuperview()
      }
    }
  }
  func layoutRectangleBackgroundView() {
    self.backgroundView.add(rectangleBackgroundView) {
      $0.backgroundColor = .white
      $0.setRounded(radius: 40)
      $0.snp.makeConstraints {
        $0.top.equalToSuperview().offset(201)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(306)
        $0.height.equalTo(323)
      }
    }
  }
  func layoutUserImageView() {
    self.rectangleBackgroundView.add(userImageView) {
      $0.setBorder(borderColor: .hackerBlack, borderWidth: 3)
      $0.setRounded(radius: 34)
      $0.image = UIImage(named: "200")
      $0.snp.makeConstraints {
        $0.top.equalToSuperview().offset(32)
        $0.centerX.equalToSuperview()
        $0.width.height.equalTo(68)
      }
    }
  }
  func layoutUserNameLine() {
    self.rectangleBackgroundView.add(userNameLine) {
      $0.image = UIImage(named: "idLine")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userImageView.snp.bottom).offset(5)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(215)
        $0.height.equalTo(39)
      }
    }
  }
  func layoutUserNameLabel() {
    self.rectangleBackgroundView.add(userNameLabel) {
      $0.setupLabel(text: self.username ?? "", color: .hackerBlack, font: .bodyRegular(ofSize: 16))
      $0.snp.makeConstraints {
        $0.bottom.equalTo(self.userNameLine).offset(-5)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutCheckLabel() {
    self.rectangleBackgroundView.add(checkLabel) {
      $0.setupLabel(text: "추가할 유저가 맞는지\n다시 한번 확인해주세요!", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      $0.numberOfLines = 2
      $0.textAlignment = .center
      $0.snp.makeConstraints {
        $0.top.equalTo(self.userNameLine.snp.bottom).offset(22)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutButtonContainerView() {
    self.rectangleBackgroundView.add(buttonContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.bottom.equalTo(self.rectangleBackgroundView.snp.bottom).offset(-24)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(258)
        $0.height.equalTo(60)
      }
    }
  }
  func layoutYesButton() {
    self.buttonContainerView.add(yesButton) {
      $0.setBackgroundImage(UIImage(named: "yesnoButton"), for: .normal)
      $0.setupButton(title: "네", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
      $0.addTarget(self, action: #selector(self.pushNickNameVC), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.top.leading.equalToSuperview()
        $0.width.equalTo(120)
        $0.height.equalTo(60)
      }
    }
  }
  func layoutNoButton() {
    self.buttonContainerView.add(noButton) {
      $0.setBackgroundImage(UIImage(named: "yesnoButton"), for: .normal)
      $0.setupButton(title: "아니요", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
      $0.addTarget(self, action: #selector(self.dismissPopUpVC), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.top.trailing.equalToSuperview()
        $0.width.equalTo(120)
        $0.height.equalTo(60)
      }
    }
  }
  @objc func pushNickNameVC() {
    if let id = friendId {
      LoadingHUD.show()
      FriendAPI.shared.addFriend(requestBody: AddFriendRequest(friendId: id)) { (response) in
        LoadingHUD.hide()
        switch response {
        case .success(let data):
          if let userGithubInfo = data as? AddFriendResponse {
            if userGithubInfo.isFriend {
              self.dismiss(animated: false) {
                self.parentVC?.navigationController?.popToRootViewController(animated: true)
                print(self.parentVC?.navigationController)
              }
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
  @objc func dismissPopUpVC() {
    self.dismiss(animated: false, completion: nil)
  }
}
