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
  
  var teamStackView = UIStackView().then {
    $0.axis = .horizontal
    $0.spacing = 10
    $0.alignment = .center
  }
  
  var labelStackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 2
    $0.alignment = .leading
  }
  
  var faceImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
  
  var hairImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
  
  var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .titleBold(ofSize: 24)
    $0.text = "HACKER iOS"
    $0.numberOfLines = 2
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
    addSubviews([backgroundWithBorder, teamStackView, hairImage, rankingFirstImage])
    teamStackView.addArrangedSubview(faceImage)
    teamStackView.addArrangedSubview(labelStackView)
    labelStackView.addArrangedSubview(nameLabel)
    labelStackView.addArrangedSubview(commitLabel)
    
    backgroundWithBorder.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.leading.trailing.equalToSuperview().inset(24)
    }
    rankingFirstImage.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(5)
      make.leading.equalToSuperview().inset(41)
      make.centerX.equalToSuperview()
    }
    teamStackView.snp.makeConstraints { make in
      make.centerX.equalToSuperview().offset(-10).priority(.high)
      make.leading.greaterThanOrEqualTo(self.backgroundWithBorder).offset(15)
      make.trailing.lessThanOrEqualTo(self.backgroundWithBorder).inset(15)
      make.top.equalTo(self.rankingFirstImage.snp.bottom).offset(4)
      make.bottom.equalTo(self.backgroundWithBorder).inset(10)
    }
    faceImage.snp.makeConstraints { make in
      make.width.equalTo(101)
      make.height.equalTo(111)
    }
    hairImage.snp.makeConstraints { make in
      make.edges.equalTo(faceImage)
    }
  }
}
