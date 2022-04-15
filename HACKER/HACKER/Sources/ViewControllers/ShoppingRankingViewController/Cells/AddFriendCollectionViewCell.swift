//
//  AddFriendCollectionViewCell.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/26.
//

import UIKit

import SnapKit
import Then

// MARK: - AddFriendCollectionViewCell
class AddFriendCollectionViewCell: UICollectionViewCell {
    
  // MARK: - Components
  let lineborderView = UIView()
  let plusButton = UIImageView()
  let plusLabel = UILabel()
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
}
// MARK: - Extensions
extension AddFriendCollectionViewCell {
  func layout() {
    layoutLineBorderView()
    layoutPlusButton()
    layoutPlusLabel()
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
  func layoutPlusButton() {
    self.lineborderView.add(plusButton) {
      $0.image = UIImage(named: "shoppingPlusBtn")
      $0.snp.makeConstraints { make in
        make.top.equalToSuperview().offset(39)
        make.centerX.equalToSuperview()
        make.width.equalTo(43)
        make.height.equalTo(47)
      }
    }
  }
  func layoutPlusLabel() {
    self.lineborderView.add(plusLabel) {
      $0.setupLabel(text: "추가하기", color: .hackerBlack, font: .btnText(ofSize: 18))
      $0.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.bottom.equalToSuperview().offset(-20)
      }
    }
  }
}
