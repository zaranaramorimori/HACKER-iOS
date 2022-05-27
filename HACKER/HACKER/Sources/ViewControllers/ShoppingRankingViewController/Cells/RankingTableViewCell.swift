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
  let userhairfirstImage = UIImageView()
  let userhairsecondImage = UIImageView()
  let userhairthirdImage = UIImageView()
  let userhairfourthImage = UIImageView()
  let userhairfifthImage = UIImageView()
  let userhairsixthImage = UIImageView()
  let userhairseventhImage = UIImageView()
  let userhaireighthImage = UIImageView()
  let userhairninethImage = UIImageView()
  let userhairtenthImage = UIImageView()
  let userhaireleventhImage = UIImageView()
  let userhairtwelvethImage = UIImageView()
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
    layoutUserHairFirstImage()
    layoutUserHairSecondImage()
    layoutUserHairThirdImage()
    layoutUserHairFourthImage()
    layoutUserHairFifthImage()
    layoutUserHairSixthImage()
    layoutUserHairSeventhImage()
    layoutUserHairEighthImage()
    layoutUserHairNinethImage()
    layoutUserHairTenthImage()
    layoutUserHairEleventhImage()
    layoutUserHairTwelvethImage()
    layoutSeparateView()
  }
  func layoutRankingLabel() {
    self.contentView.add(rankingLabel) {
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
        make.width.equalTo(130)
        make.height.equalTo(40)
      }
    }
  }
  func layoutUserNameLabel() {
    self.labelContainerView.addArrangedSubview(userNameLabel)
    userNameLabel.textAlignment = .center
  }
  func layoutUserCommitLabel() {
    self.labelContainerView.addArrangedSubview(usercommitLabel)
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
  func layoutUserHairFirstImage() {
    self.contentView.add(userhairfirstImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairSecondImage() {
    self.contentView.add(userhairsecondImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairThirdImage() {
    self.contentView.add(userhairthirdImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairFourthImage() {
    self.contentView.add(userhairfourthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairFifthImage() {
    self.contentView.add(userhairfifthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairSixthImage() {
    self.contentView.add(userhairsixthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairSeventhImage() {
    self.contentView.add(userhairseventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairEighthImage() {
    self.contentView.add(userhaireighthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairNinethImage() {
    self.contentView.add(userhairninethImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairTenthImage() {
    self.contentView.add(userhairtenthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairEleventhImage() {
    self.contentView.add(userhaireleventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.trailing.equalToSuperview().offset(-43)
        make.width.equalTo(61)
        make.height.equalTo(68)
      }
    }
  }
  func layoutUserHairTwelvethImage() {
    self.contentView.add(userhairtwelvethImage) {
      $0.contentMode = .scaleAspectFit
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
