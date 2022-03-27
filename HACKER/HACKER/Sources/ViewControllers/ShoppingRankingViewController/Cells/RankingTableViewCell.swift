//
//  RankingTableViewCell.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/27.
//

import UIKit

import SnapKit
import Then

// MARK: - RankingTableViewCell
class RankingTableViewCell: UITableViewCell {
  // MARK: - Components
  let rankingLabel = UILabel()
  let labelContainerView = UIStackView()
  let userNameLabel = UILabel()
  let usercommitLabel = UILabel()
  let userhairImage = UIImageView()
  let separateView = UIView()
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
}
// MARK: - Extensions
extension RankingTableViewCell {
  func layout() {
    layoutRankingLabel()
    layoutLabelContainerView()
    layoutUserNameLabel()
    layoutUserCommitLabel()
    layoutUserHairImage()
    layoutSeparateView()
  }
  func layoutRankingLabel() {
    self.contentView.add(rankingLabel) {
      $0.setupLabel(text: "4등", color: .hackerBlack, font: .subtitleMedium(ofSize: 20))
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.leading.equalToSuperview().offset(59)
      }
    }
  }
  func layoutLabelContainerView() {
    self.contentView.add(labelContainerView) {
      $0.distribution = .equalSpacing
      $0.axis = .vertical
      $0.alignment = .center
      $0.spacing = 0
      $0.snp.makeConstraints { make in
        make.centerX.centerY.equalToSuperview()
        make.height.equalTo(40)
      }
    }
  }
  func layoutUserNameLabel() {
    self.labelContainerView.addArrangedSubview(userNameLabel)
    userNameLabel.setupLabel(text: "지수가 4등이라니", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    userNameLabel.textAlignment = .center
  }
  func layoutUserCommitLabel() {
    self.labelContainerView.addArrangedSubview(usercommitLabel)
    usercommitLabel.setupLabel(text: "1,492커밋", color: .hackerBlack, font: .bodyRegular(ofSize: 12))
    userNameLabel.textAlignment = .center
  }
  func layoutUserHairImage() {
    self.contentView.add(userhairImage) {
      $0.image = UIImage(named: "userCharacterImage")
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutSeparateView() {
    self.contentView.add(separateView) {
      $0.backgroundColor = .hackerLightGray
      $0.snp.makeConstraints { make in
        make.leading.trailing.equalToSuperview()
        make.bottom.equalToSuperview()
        make.height.equalTo(1)
      }
    }
  }
}
