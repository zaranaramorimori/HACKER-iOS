//
//  MyFriendsCollectionViewCell.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/26.
//

import UIKit

import SnapKit
import Then

// MARK: - MyFriendsCollectionViewCell
class MyFriendsCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Components
  let lineborderView = UIView()
  let userImageView = UIImageView()
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
  let userNameLabel = UILabel()
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
}
// MARK: - Extensions
extension MyFriendsCollectionViewCell {
  func layout() {
    layoutLineBorderView()
    layoutUserImageView()
    layoutUserFirstHairImage()
    layoutUserSecondHairImage()
    layoutUserThirdHairImage()
    layoutUserFourthHairImage()
    layoutUserFifthtHairImage()
    layoutUserSixthHairImage()
    layoutUserSeventhHairImage()
    layoutUserEighthHairImage()
    layoutUserNinethHairImage()
    layoutUserTenthHairImage()
    layoutUserEleventhHairImage()
    layoutUserTwelvethHairImage()
    layoutUserNameLabel()
  }
  func layoutLineBorderView() {
    self.contentView.add(lineborderView) {
      $0.backgroundColor = .hackerWhite
      $0.setBorder(borderColor: .hackerBlack, borderWidth: 3)
      $0.setRounded(radius: 10)
      $0.snp.makeConstraints { make in
        make.top.leading.trailing.bottom.equalToSuperview()
      }
    }
  }
  func layoutUserImageView() {
    self.lineborderView.add(userImageView) {
      $0.image = UIImage(named: "userCharacterImage")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalToSuperview().offset(13)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserFirstHairImage() {
    self.contentView.add(userhairfirstImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserSecondHairImage() {
    self.contentView.add(userhairsecondImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserThirdHairImage() {
    self.contentView.add(userhairthirdImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserFourthHairImage() {
    self.contentView.add(userhairfourthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserFifthtHairImage() {
    self.contentView.add(userhairfifthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserSixthHairImage() {
    self.contentView.add(userhairsixthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserSeventhHairImage() {
    self.contentView.add(userhairseventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserEighthHairImage() {
    self.contentView.add(userhaireighthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserNinethHairImage() {
    self.contentView.add(userhairninethImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserTenthHairImage() {
    self.contentView.add(userhairtenthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserEleventhHairImage() {
    self.contentView.add(userhaireleventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserTwelvethHairImage() {
    self.contentView.add(userhairtwelvethImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView)
        make.leading.equalToSuperview().offset(6)
        make.trailing.equalToSuperview().offset(-6)
        make.bottom.equalToSuperview().offset(-38)
      }
    }
  }
  func layoutUserNameLabel() {
    self.lineborderView.add(userNameLabel) {
      $0.textAlignment = .center
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.userImageView.snp.bottom)
        make.leading.trailing.equalToSuperview()
      }
    }
  }
}
