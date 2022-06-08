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
  
  var labelStackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 3
    $0.alignment = .leading
  }
  
  var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .titleBold(ofSize: 24)
    $0.text = "HACKER iOS"
    $0.lineBreakMode = .byCharWrapping
    $0.numberOfLines = 2
  }
  
  var commitLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleRegular(ofSize: 18)
    $0.text = "1500 커밋"
  }
  
  var faceImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
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
    addSubviews([faceImage, hairImage, rankLabel, labelStackView])
    labelStackView.addArrangedSubview(nameLabel)
    labelStackView.addArrangedSubview(commitLabel)
    
    faceImage.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.trailing.equalToSuperview().inset(36)
      make.height.equalTo(111)
      make.width.equalTo(101)
    }
    hairImage.snp.makeConstraints { make in
      make.edges.equalTo(faceImage)
    }
    labelStackView.snp.makeConstraints { make in
      make.leading.equalTo(self.rankLabel.snp.trailing).offset(20)
      make.trailing.equalTo(self.faceImage.snp.leading).offset(-10)
      make.centerY.equalToSuperview()
    }
    rankLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.leading.equalToSuperview().inset(55).priority(.high)
    }
  }
}
