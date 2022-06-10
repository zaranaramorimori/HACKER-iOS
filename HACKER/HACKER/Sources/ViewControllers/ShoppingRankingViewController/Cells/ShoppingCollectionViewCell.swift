//
//  ShoppingCollectionViewCell.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/26.
//

import UIKit

import SnapKit
import Then

// MARK: - ShoppingCollectionViewCell
class ShoppingCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Components
  let myFriendsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  var friendList = [SearchFriendResponse]() {
    didSet {
      myFriendsCollectionView.reloadData()
    }
  }
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    register()
    attribute()
    layout()
  }
}
// MARK: - Extensions
extension ShoppingCollectionViewCell {
  func register() {
    self.myFriendsCollectionView.register(AddFriendCollectionViewCell.self, forCellWithReuseIdentifier: AddFriendCollectionViewCell.identifier)
    self.myFriendsCollectionView.register(MyFriendsCollectionViewCell.self, forCellWithReuseIdentifier: MyFriendsCollectionViewCell.identifier)
  }
  func attribute() {
    self.myFriendsCollectionView.delegate = self
    self.myFriendsCollectionView.dataSource = self
  }
  func layout() {
    layoutMyFriendsCollectionView()
  }
  func layoutMyFriendsCollectionView() {
    self.contentView.add(myFriendsCollectionView) {
      $0.backgroundColor = .hackerWhite
      $0.isUserInteractionEnabled = true
      $0.showsVerticalScrollIndicator = false
      $0.snp.makeConstraints { make in
        make.top.equalToSuperview()
        make.leading.equalToSuperview().offset(24)
        make.trailing.equalToSuperview().offset(-24)
        make.bottom.equalToSuperview()
      }
    }
  }
  func setupNewFriend() {
    let addFriendVC = AddFriendViewController()
    self.parentViewController?.navigationController?.pushViewController(addFriendVC, animated: false)
  }
  // MARK: - Network
  func shoppingWithAPI(userID: Int) {
    LoadingHUD.show()
    ShoppingAPI.shared.friendDetail(userID: userID) { response in
      LoadingHUD.hide()
      switch response {
      case .success(let data):
        if let shoppingInfo = data as? ShoppingResponse {
          let friendDetailVC = FriendDetailViewController()
          friendDetailVC.userNicknameLabel.setupLabel(text: shoppingInfo.user.nickname, color: .hackerBlack, font: .titleBold(ofSize: 24))
          friendDetailVC.userGithubNameLabel.setupLabel(text: shoppingInfo.user.username, color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
          friendDetailVC.hairNumLabel.setupLabel(text: "\(shoppingInfo.user.hairCount)가닥", color: .hackerBlack, font: .btnText(ofSize: 40))
          friendDetailVC.userhairfirstImage.updateServerImage(shoppingInfo.head ?? "")
          friendDetailVC.getuserID = userID 
          self.parentViewController?.navigationController?.pushViewController(friendDetailVC, animated: false)
        }
      case .requestErr(let status):
        print("shoppingWithAPI - requestErr: \(status)")
      case .pathErr:
        print("userPhotosWithAPI - pathErr")
      case .serverErr:
        print("userPhotosWithAPI - serverErr")
      case .networkFail:
        print("userPhotosWithAPI - networkFail")
      default:
        print("default!")
      }
    }
  }
}
// MARK: - UICollectionViewDataSource
extension ShoppingCollectionViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if !friendList.isEmpty {
      print(friendList.count)
      return friendList.count+1
    } else {
      return 1
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let addCell = collectionView.dequeueReusableCell(withReuseIdentifier: AddFriendCollectionViewCell.identifier, for: indexPath) as? AddFriendCollectionViewCell else { return UICollectionViewCell() }
    guard let friendCell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFriendsCollectionViewCell.identifier, for: indexPath) as? MyFriendsCollectionViewCell else { return UICollectionViewCell() }
    
    if indexPath.item == 0 {
      addCell.awakeFromNib()
      return addCell
    }
    if !friendList.isEmpty {
      print(friendList)
      friendCell.userNameLabel.setupLabel(text: friendList[indexPath.item-1].nickname ?? "", color: .hackerBlack, font: .bodyRegular(ofSize: 14))
      friendCell.userhairfirstImage.updateServerImage(friendList[indexPath.item-1].head ?? "")
      friendCell.awakeFromNib()
    }
    return friendCell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.item == 0 {
      self.setupNewFriend()
    } else {
      self.shoppingWithAPI(userID: friendList[indexPath.item-1].id)
    }
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ShoppingCollectionViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellWidth = (collectionView.frame.width-24)/3
    let cellHeight = (cellWidth)*1.38
    return CGSize(width: cellWidth, height: cellHeight)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }
}
