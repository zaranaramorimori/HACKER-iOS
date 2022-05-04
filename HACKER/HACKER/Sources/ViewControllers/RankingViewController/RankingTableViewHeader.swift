//
//  RankingTableViewHeader.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class RankingTableViewHeader: UITableViewHeaderFooterView {
  
  static let identifier = "RankingTableViewHeader"
  
  // MARK: - UI
  var backgroundWithBorder = UIView().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 27
    $0.layer.borderWidth = 3
    $0.layer.borderColor = UIColor.hackerBlack.cgColor
  }
  
  var rankingFirstImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
    $0.image = UIImage(named: "rankingFirstImage")
  }
  
  var faceImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
    $0.image = UIImage(named: "teamCharacterImage")
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
  
  // MARK: - Init
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setupAutoLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Setup Method
  private func setupAutoLayout() {
    addSubviews([backgroundWithBorder, rankingFirstImage,
                 faceImage, nameLabel, commitLabel])
    
    backgroundWithBorder.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.leading.trailing.equalToSuperview().inset(24)
    }
    rankingFirstImage.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(5)
      make.leading.equalToSuperview().inset(41)
      make.centerX.equalToSuperview()
    }
    faceImage.snp.makeConstraints { make in
      make.bottom.equalToSuperview().inset(26)
      make.leading.equalToSuperview().inset(62)
    }
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(rankingFirstImage.snp.bottom).offset(23)
      make.leading.equalTo(faceImage.snp.trailing).offset(20)
    }
    commitLabel.snp.makeConstraints { make in
      make.leading.equalTo(faceImage.snp.trailing).offset(20)
      make.bottom.equalToSuperview().inset(38)
    }
  }
}
