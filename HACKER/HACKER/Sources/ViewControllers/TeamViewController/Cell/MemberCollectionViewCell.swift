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
    $0.textAlignment = .center
  }
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    setupLayout()
  }
  
  // MARK: - Setup Method
  private func setupLayout() {
    addSubviews([backgroundWithBorder, characterImage, hairImage, nameLabel])
    
    backgroundWithBorder.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    characterImage.snp.makeConstraints { make in
      make.centerY.equalToSuperview().offset(-10)
      make.leading.trailing.equalToSuperview().inset(6.5)
    }
    
    hairImage.snp.makeConstraints { make in
      make.edges.equalTo(characterImage)
    }
    
    nameLabel.snp.makeConstraints { make in
      make.height.equalTo(20)
      make.leading.trailing.equalToSuperview().inset(10)
      make.bottom.equalToSuperview().inset(10)
    }
  }
}
