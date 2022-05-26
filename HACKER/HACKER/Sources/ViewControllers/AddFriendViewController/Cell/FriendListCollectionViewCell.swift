//
//  FriendListCollectionViewCell.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/23.
//

import UIKit
import Then

class FriendListCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Properties
  static let identifier = "FriendListCollectionViewCell"
  var currentFriendData: FriendGithubResponse?
  var isChecked: Bool = false
    
  // MARK: - Components
  private var profileImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.setRounded(radius: 32)
    $0.setBorder(borderColor: .hackerBlack, borderWidth: 3)
    $0.backgroundColor = .hackerLightGray
  }
  
  private var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .titleBold(ofSize: 20)
  }
  
  private var usernameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .bodyRegular(ofSize: 16)
  }
  
  private var checkButton = UIImageView().then {
    $0.contentMode = .center
  }
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    setupLayout()
    updateCheckButton()
    updateCell()
  }
}

extension FriendListCollectionViewCell {
  private func setupLayout() {
    self.contentView.addSubviews([profileImageView, nameLabel, usernameLabel, checkButton])
    
    contentView.setBorder(borderColor: .hackerBlack, borderWidth: 3)
    contentView.setRounded(radius: 20)
    
    profileImageView.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.centerY.equalToSuperview()
      make.width.height.equalTo(64)
    }
    
    nameLabel.snp.makeConstraints { make in
      make.leading.equalTo(self.profileImageView.snp.trailing).offset(16)
      make.trailing.equalTo(self.checkButton.snp.leading).offset(10)
      make.top.equalToSuperview().offset(23)
    }
    
    usernameLabel.snp.makeConstraints { make in
      make.leading.equalTo(self.nameLabel)
      make.trailing.equalTo(self.checkButton.snp.leading).offset(10)
      make.top.equalTo(self.nameLabel.snp.bottom)
    }
    
    checkButton.snp.makeConstraints { make in
      make.trailing.equalToSuperview().inset(18)
      make.width.equalTo(66)
      make.centerY.equalToSuperview()
    }
  }
  
  func updateCell() {
    guard let data = currentFriendData else { return }
    
    profileImageView.updateServerImage(currentFriendData?.profileImage ?? "")
    nameLabel.text = data.nickname
    usernameLabel.text = data.username
    
    if data.isFriend {
      contentView.alpha = 0.3
    } else {
      contentView.alpha = 1
    }
  }
}

// MARK: - Actions
extension FriendListCollectionViewCell {
  @objc private func updateCheckButton() {
    guard let data = currentFriendData else { return }
    
    if data.isFriend {
      checkButton.image = UIImage(named: "userAddedIcon")
      checkButton.isUserInteractionEnabled = false
    } else {
      checkButton.isUserInteractionEnabled = true
      if isChecked {
        checkButton.image = UIImage(named: "addFriend_chackOn")
      } else {
        checkButton.image = UIImage(named: "addFriend_chackOff")
      }
    }
  }
}
