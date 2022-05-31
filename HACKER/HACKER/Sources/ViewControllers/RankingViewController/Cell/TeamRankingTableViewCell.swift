//
//  TeamRankingTableViewCell.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class TeamRankingTableViewCell: UITableViewCell {
  static let identifier = "TeamRankingTableViewCell"
  
  // MARK: - UI
  var rankLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleMedium(ofSize: 20)
    $0.text = "3등"
    $0.sizeToFit()
  }
  
  var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .titleBold(ofSize: 24)
    $0.text = "FILL-IN"
    $0.lineBreakMode = .byTruncatingTail
  }
  
  var commitLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleRegular(ofSize: 18)
    $0.text = "1500 커밋"
  }
  
  var faceImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
    $0.image = UIImage(named: "teamCharacterImage")
  }
  
  var hairImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
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
    addSubviews([faceImage, hairImage, rankLabel,
                 nameLabel, commitLabel])
    faceImage.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(16)
      make.trailing.equalToSuperview().inset(41)
      make.height.equalTo(faceImage.snp.width).multipliedBy(1).priority(.low)
    }
    hairImage.snp.makeConstraints { make in
      make.edges.equalTo(faceImage)
    }
    rankLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.leading.equalToSuperview().inset(55).priority(.high)
    }
    nameLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(32)
      make.leading.equalTo(rankLabel.snp.trailing).offset(20)
      make.trailing.equalTo(faceImage.snp.leading).offset(-10)
      make.width.equalTo(150)
    }
    commitLabel.snp.makeConstraints { make in
      make.leading.equalTo(rankLabel.snp.trailing).offset(20)
      make.bottom.equalToSuperview().inset(32)
    }
    
  }
}
