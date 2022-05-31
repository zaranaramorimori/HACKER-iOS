//
//  MemberCollectionViewCell.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class MemberCollectionViewCell: UICollectionViewCell {
  
  // MARK: - UI
  var backgroundWithBorder = UIView().then {
    $0.backgroundColor = .hackerWhite
    $0.layer.cornerRadius = 10
    $0.layer.borderWidth = 3
    $0.layer.borderColor = UIColor.hackerBlack.cgColor
  }
  
  var characterImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
    $0.image = UIImage(named: "mainHead")
  }
  
  var hairImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
  
  var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleRegular(ofSize: 14)
    $0.text = "두두두두두"
  }
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    setupLayout()
  }
  
  // MARK: - Setup Method
  private func setupLayout() {
    addSubviews([backgroundWithBorder, nameLabel, characterImage, hairImage])
    
    backgroundWithBorder.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    nameLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalToSuperview().inset(7)
    }
    
    characterImage.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().inset(13)
      make.leading.trailing.equalToSuperview().inset(3)
      make.bottom.equalTo(nameLabel.snp.top).offset(-12)
    }
    
    hairImage.snp.makeConstraints { make in
      make.edges.equalTo(characterImage)
    }
  }
}
