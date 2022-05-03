//
//  TeamRankingTableViewCell.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit

class TeamRankingTableViewCell: UITableViewCell {
  static let identifier = "TeamRankingTableViewCell"
  
  // MARK: - UI
  var rankLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleMedium(ofSize: 20)
    $0.text = "3등"
  }
  
  var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .titleBold(ofSize: 24)
    $0.text = "FILL-IN"
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
 
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Method
  private func setupLayout() {
    addSubviews([rankLabel, nameLabel,
                 commitLabel, faceImage])
    
    rankLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.leading.equalToSuperview().inset(55)
    }
    nameLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(41)
      make.leading.equalTo(rankLabel.snp.trailing).offset(20)
    }
    commitLabel.snp.makeConstraints { make in
      make.leading.equalTo(rankLabel.snp.trailing).offset(20)
      make.bottom.equalToSuperview().inset(33)
    }
    faceImage.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.trailing.equalToSuperview().inset(41)
    }
  }
}
