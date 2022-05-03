//
//  FightTableViewCell.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class FightTableViewCell: UITableViewCell {
  
  static let identifier = "FightTableViewCell"
  
  // MARK: - UI
  var backgroundWithBorder = UIView().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 25
    $0.layer.borderWidth = 3
    $0.layer.borderColor = UIColor.hackerBlack.cgColor
  }
  
  var logoImage = UIImageView().then {
    $0.contentMode = .scaleToFill
    $0.image = UIImage(named: "nextBtnBlack")
  }
  
  var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleRegular(ofSize: 16)
    $0.text = "기관명"
  }
  
  var titleLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .titleBold(ofSize: 20)
    $0.text = "19th AppJam"
  }
  
  var dateLabel = UILabel().then {
    $0.textColor = .lightGray
    $0.font = .subtitleRegular(ofSize: 14)
    $0.text = "2022.01.22 ~ 2022.02.22"
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Method
  private func setupLayout() {
    addSubviews([backgroundWithBorder, logoImage, nameLabel,
                 titleLabel, dateLabel])
    
    backgroundWithBorder.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    logoImage.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.leading.trailing.equalToSuperview().inset(20)
    }
    
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(logoImage.snp.bottom).offset(8)
      make.leading.equalToSuperview().inset(20)
    }
    
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom).offset(4)
      make.leading.equalToSuperview().inset(20)
    }
    
    dateLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(8)
      make.leading.equalToSuperview().inset(20)
    }
  }
}
