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
