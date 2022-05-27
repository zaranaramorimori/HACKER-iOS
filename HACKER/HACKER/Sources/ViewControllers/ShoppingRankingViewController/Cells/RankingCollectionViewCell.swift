//
//  RankingCollectionViewCell.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/26.
//

import UIKit

import SnapKit
import Then

// MARK: - RankingCollectionViewCell
class RankingCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Components
  let headerView = UIView()
  let headerStackView = UIStackView()
  let firstContainerView = UIView()
  let firstUser = UIImageView()
  let firstUserImage = UIImageView()
  let firstuserhairfirstImage = UIImageView()
  let firstuserhairsecondImage = UIImageView()
  let firstuserhairthirdImage = UIImageView()
  let firstuserhairfourthImage = UIImageView()
  let firstuserhairfifthImage = UIImageView()
  let firstuserhairsixthImage = UIImageView()
  let firstuserhairseventhImage = UIImageView()
  let firstuserhaireighthImage = UIImageView()
  let firstuserhairninethImage = UIImageView()
  let firstuserhairtenthImage = UIImageView()
  let firstuserhaireleventhImage = UIImageView()
  let firstuserhairtwelvethImage = UIImageView()
  let firstUserNameLabel = UILabel()
  let firstUserCommitLabel = UILabel()
  let secondContainerView = UIView()
  let secondUser = UIImageView()
  let secondUserImage = UIImageView()
  let seconduserhairfirstImage = UIImageView()
  let seconduserhairsecondImage = UIImageView()
  let seconduserhairthirdImage = UIImageView()
  let seconduserhairfourthImage = UIImageView()
  let seconduserhairfifthImage = UIImageView()
  let seconduserhairsixthImage = UIImageView()
  let seconduserhairseventhImage = UIImageView()
  let seconduserhaireighthImage = UIImageView()
  let seconduserhairninethImage = UIImageView()
  let seconduserhairtenthImage = UIImageView()
  let seconduserhaireleventhImage = UIImageView()
  let seconduserhairtwelvethImage = UIImageView()
  let secondUserNameLabel = UILabel()
  let secondUserCommitLabel = UILabel()
  let thirdContainerView = UIView()
  let thirdUser = UIImageView()
  let thirdUserImage = UIImageView()
  let thirduserhairfirstImage = UIImageView()
  let thirduserhairsecondImage = UIImageView()
  let thirduserhairthirdImage = UIImageView()
  let thirduserhairfourthImage = UIImageView()
  let thirduserhairfifthImage = UIImageView()
  let thirduserhairsixthImage = UIImageView()
  let thirduserhairseventhImage = UIImageView()
  let thirduserhaireighthImage = UIImageView()
  let thirduserhairninethImage = UIImageView()
  let thirduserhairtenthImage = UIImageView()
  let thirduserhaireleventhImage = UIImageView()
  let thirduserhairtwelvethImage = UIImageView()
  let thirdUserNameLabel = UILabel()
  let thirdUserCommitLabel = UILabel()
  let separateView = UIView()
  let rankingTableView = UITableView()
  
  var rankList: RankingResponse?
  let screenWidth = UIScreen.main.bounds.width-48
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    register()
    attribute()
    layout()
    updateServerData()
  }
}
// MARK: - Extensions
extension RankingCollectionViewCell {
  func register() {
    self.rankingTableView.register(RankingTableViewCell.self, forCellReuseIdentifier: RankingTableViewCell.identifier)
  }
  func attribute() {
    self.rankingTableView.delegate = self
    self.rankingTableView.dataSource = self
    self.rankingTableView.tableHeaderView = headerView
  }
  func layout() {
    layoutHeaderView()
    layoutHeaderStackView()
    layoutFirstContainerView()
    layoutFirstUser()
    layoutFirstUserImage()
    layoutFirstUserFirstHairImage()
    layoutFirstUserSecondHairImage()
    layoutFirstUserThirdHairImage()
    layoutFirstUserFourthHairImage()
    layoutFirstUserFifthHairImage()
    layoutFirstUserSixthHairImage()
    layoutFirstUserSeventhHairImage()
    layoutFirstUserEighthHairImage()
    layoutFirstUserNinethHairImage()
    layoutFirstUserTenthHairImage()
    layoutFirstUserEleventhHairImage()
    layoutFirstUserTwelvethhairImage()
    layoutFirstUserNameLabel()
    layoutFirstUserCommitLabel()
    layoutSecondContainerView()
    layoutSecondUser()
    layoutSecondUserImage()
    layoutSecondUserFirstHairImage()
    layoutSecondUserSecondHairImage()
    layoutSecondUserThirdHairImage()
    layoutSecondUserFourthHairImage()
    layoutSecondUserFifthHairImage()
    layoutSecondUserSixthHairImage()
    layoutSecondUserSeventhHairImage()
    layoutSecondUserEighthHairImage()
    layoutSecondUserNinethHairImage()
    layoutSecondUserTenthHairImage()
    layoutSecondUserEleventhHairImage()
    layoutSecondUserTwelvethHairImage()
    layoutSecondUserNameLabel()
    layoutSecondUserCommitLabel()
    layoutThirdContainerView()
    layoutThirdUser()
    layoutThirdUserImage()
    layoutThirdUserFirstHairImage()
    layoutThirdUserSecondHairImage()
    layoutThirdUserThirdHairImage()
    layoutThirdUserFourthHairImage()
    layoutThirdUserFifthHairImage()
    layoutThirdUserSixthHairImage()
    layoutThirdUserSeventhHairImage()
    layoutThirdUserEighthHairImage()
    layoutThirdUserNinethHairImage()
    layoutThirdUserTenthHairImage()
    layoutThirdUserEleventhHairImage()
    layoutThirdUserTwelvethHairImage()
    layoutThirdUserNameLabel()
    layoutThirdUserCommitLabel()
    layoutSeparateView()
    layoutRankingTableView()
  }
  func layoutHeaderView() {
    headerView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 325)
    headerView.backgroundColor = .hackerWhite
  }
  func layoutHeaderStackView() {
    headerStackView.distribution = .fillEqually
    headerStackView.alignment = .center
    headerStackView.spacing = 0
    self.headerView.add(headerStackView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints { make in
        make.top.centerX.equalToSuperview()
        make.height.equalTo(325)
      }
    }
  }
  func layoutFirstContainerView() {
    self.headerStackView.addArrangedSubview(firstContainerView)
    firstContainerView.snp.makeConstraints { make in
      make.width.equalTo(self.screenWidth/3)
      make.height.equalTo(325)
    }
  }
  func layoutFirstUser() {
    self.firstContainerView.add(firstUser) {
      $0.image = UIImage(named: "rankingSecondImage")
      $0.snp.makeConstraints { make in
        make.top.equalToSuperview().offset(96)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutFirstUserImage() {
    self.firstContainerView.add(firstUserImage) {
      $0.image = UIImage(named: "userCharacterImage")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserFirstHairImage() {
    self.firstContainerView.add(firstuserhairfirstImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserSecondHairImage() {
    self.firstContainerView.add(firstuserhairsecondImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserThirdHairImage() {
    self.firstContainerView.add(firstuserhairthirdImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserFourthHairImage() {
    self.firstContainerView.add(firstuserhairfourthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserFifthHairImage() {
    self.firstContainerView.add(firstuserhairfifthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserSixthHairImage() {
    self.firstContainerView.add(firstuserhairsixthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserSeventhHairImage() {
    self.firstContainerView.add(firstuserhairseventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserEighthHairImage() {
    self.firstContainerView.add(firstuserhaireighthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserNinethHairImage() {
    self.firstContainerView.add(firstuserhairninethImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserTenthHairImage() {
    self.firstContainerView.add(firstuserhairtenthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserEleventhHairImage() {
    self.firstContainerView.add(firstuserhaireleventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserTwelvethhairImage() {
    self.firstContainerView.add(firstuserhairtwelvethImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutFirstUserNameLabel() {
    self.firstContainerView.add(firstUserNameLabel) {
      $0.setupLabel(text: "지수", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUserImage.snp.bottom).offset(8)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutFirstUserCommitLabel() {
    self.firstContainerView.add(firstUserCommitLabel) {
      $0.setupLabel(text: "1,854 커밋", color: .hackerBlack, font: .bodyRegular(ofSize: 12))
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.firstUserNameLabel.snp.bottom)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutSecondContainerView() {
    self.headerStackView.addArrangedSubview(secondContainerView)
    secondContainerView.snp.makeConstraints { make in
      make.width.equalTo(self.screenWidth/3)
      make.height.equalTo(325)
    }
  }
  func layoutSecondUser() {
    self.secondContainerView.add(secondUser) {
      $0.image = UIImage(named: "rankingFirstImage")
      $0.snp.makeConstraints { make in
        make.top.equalToSuperview().offset(22)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutSecondUserImage() {
    self.secondContainerView.add(secondUserImage) {
      $0.image = UIImage(named: "userCharacterImage")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserFirstHairImage() {
    self.secondContainerView.add(seconduserhairfirstImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserSecondHairImage() {
    self.secondContainerView.add(seconduserhairsecondImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserThirdHairImage() {
    self.secondContainerView.add(seconduserhairthirdImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserFourthHairImage() {
    self.secondContainerView.add(seconduserhairfourthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserFifthHairImage() {
    self.secondContainerView.add(seconduserhairfifthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserSixthHairImage() {
    self.secondContainerView.add(seconduserhairsixthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserSeventhHairImage() {
    self.secondContainerView.add(seconduserhairseventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserEighthHairImage() {
    self.secondContainerView.add(seconduserhaireighthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserNinethHairImage() {
    self.secondContainerView.add(seconduserhairninethImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserTenthHairImage() {
    self.secondContainerView.add(seconduserhairtenthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserEleventhHairImage() {
    self.secondContainerView.add(seconduserhaireleventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserTwelvethHairImage() {
    self.secondContainerView.add(seconduserhairtwelvethImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutSecondUserNameLabel() {
    self.secondContainerView.add(secondUserNameLabel) {
      $0.setupLabel(text: "지수", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUserImage.snp.bottom).offset(8)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutSecondUserCommitLabel() {
    self.secondContainerView.add(secondUserCommitLabel) {
      $0.setupLabel(text: "1,854 커밋", color: .hackerBlack, font: .bodyRegular(ofSize: 12))
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.secondUserNameLabel.snp.bottom)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutThirdContainerView() {
    self.headerStackView.addArrangedSubview(thirdContainerView)
    thirdContainerView.snp.makeConstraints { make in
      make.width.equalTo(self.screenWidth/3)
      make.height.equalTo(325)
    }
  }
  func layoutThirdUser() {
    self.thirdContainerView.add(thirdUser) {
      $0.image = UIImage(named: "rankingThirdImage")
      $0.snp.makeConstraints { make in
        make.top.equalToSuperview().offset(96)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutThirdUserImage() {
    self.thirdContainerView.add(thirdUserImage) {
      $0.image = UIImage(named: "userCharacterImage")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserFirstHairImage() {
    self.thirdContainerView.add(thirduserhairfirstImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserSecondHairImage() {
    self.thirdContainerView.add(thirduserhairsecondImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserThirdHairImage() {
    self.thirdContainerView.add(thirduserhairthirdImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserFourthHairImage() {
    self.thirdContainerView.add(thirduserhairfourthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserFifthHairImage() {
    self.thirdContainerView.add(thirduserhairfifthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserSixthHairImage() {
    self.thirdContainerView.add(thirduserhairsixthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserSeventhHairImage() {
    self.thirdContainerView.add(thirduserhairseventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserEighthHairImage() {
    self.thirdContainerView.add(thirduserhaireighthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserNinethHairImage() {
    self.thirdContainerView.add(thirduserhairninethImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserTenthHairImage() {
    self.thirdContainerView.add(thirduserhairtenthImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserEleventhHairImage() {
    self.thirdContainerView.add(thirduserhaireleventhImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserTwelvethHairImage() {
    self.thirdContainerView.add(thirduserhairtwelvethImage) {
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUser.snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  func layoutThirdUserNameLabel() {
    self.thirdContainerView.add(thirdUserNameLabel) {
      $0.setupLabel(text: "지수", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUserImage.snp.bottom).offset(8)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutThirdUserCommitLabel() {
    self.thirdContainerView.add(thirdUserCommitLabel) {
      $0.setupLabel(text: "1,854 커밋", color: .hackerBlack, font: .bodyRegular(ofSize: 12))
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.thirdUserNameLabel.snp.bottom)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutSeparateView() {
    self.headerView.add(separateView) {
      $0.backgroundColor = .hackerLightGray
      $0.snp.makeConstraints { make in
        make.bottom.equalTo(self.headerView)
        make.leading.trailing.equalToSuperview()
        make.height.equalTo(1)
      }
    }
  }
  func layoutRankingTableView() {
    self.contentView.add(rankingTableView) {
      $0.showsVerticalScrollIndicator = false
      $0.separatorStyle = .none
      $0.snp.makeConstraints { make in
        make.top.leading.trailing.bottom.equalToSuperview()
      }
    }
  }
  func updateServerData() {
    self.firstUserNameLabel.setupLabel(text: rankList?.ranks[1].nickname ?? "", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    self.firstUserCommitLabel.setupLabel(text: "\(rankList?.ranks[1].commitCount ?? 0) 커밋", color: .hackerBlack, font: .subtitleRegular(ofSize: 12))
    self.secondUserNameLabel.setupLabel(text: rankList?.ranks[0].nickname ?? "", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    self.secondUserCommitLabel.setupLabel(text: "\(rankList?.ranks[0].commitCount ?? 0) 커밋", color: .hackerBlack, font: .subtitleRegular(ofSize: 12))
    self.thirdUserNameLabel.setupLabel(text: rankList?.ranks[2].nickname ?? "", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    self.thirdUserCommitLabel.setupLabel(text: "\(rankList?.ranks[2].commitCount ?? 0) 커밋", color: .hackerBlack, font: .subtitleRegular(ofSize: 12))
    self.firstuserhairfirstImage.updateServerImage(rankList?.ranks[1].head?.one ?? "")
    self.firstuserhairsecondImage.updateServerImage(rankList?.ranks[1].head?.two ?? "")
    self.firstuserhairthirdImage.updateServerImage(rankList?.ranks[1].head?.three ?? "")
    self.firstuserhairfourthImage.updateServerImage(rankList?.ranks[1].head?.four ?? "")
    self.firstuserhairfifthImage.updateServerImage(rankList?.ranks[1].head?.five ?? "")
    self.firstuserhairsixthImage.updateServerImage(rankList?.ranks[1].head?.six ?? "")
    self.firstuserhairseventhImage.updateServerImage(rankList?.ranks[1].head?.seven ?? "")
    self.firstuserhaireighthImage.updateServerImage(rankList?.ranks[1].head?.eight ?? "")
    self.firstuserhairninethImage.updateServerImage(rankList?.ranks[1].head?.nine ?? "")
    self.firstuserhairtenthImage.updateServerImage(rankList?.ranks[1].head?.ten ?? "")
    self.firstuserhaireleventhImage.updateServerImage(rankList?.ranks[1].head?.eleven ?? "")
    self.firstuserhairtwelvethImage.updateServerImage(rankList?.ranks[1].head?.twelve ?? "")
    self.seconduserhairfirstImage.updateServerImage(rankList?.ranks[0].head?.one ?? "")
    self.seconduserhairsecondImage.updateServerImage(rankList?.ranks[0].head?.two ?? "")
    self.seconduserhairthirdImage.updateServerImage(rankList?.ranks[0].head?.three ?? "")
    self.seconduserhairfourthImage.updateServerImage(rankList?.ranks[0].head?.four ?? "")
    self.seconduserhairfifthImage.updateServerImage(rankList?.ranks[0].head?.five ?? "")
    self.seconduserhairsixthImage.updateServerImage(rankList?.ranks[0].head?.six ?? "")
    self.seconduserhairseventhImage.updateServerImage(rankList?.ranks[0].head?.seven ?? "")
    self.seconduserhaireighthImage.updateServerImage(rankList?.ranks[0].head?.eight ?? "")
    self.seconduserhairninethImage.updateServerImage(rankList?.ranks[0].head?.nine ?? "")
    self.seconduserhairtenthImage.updateServerImage(rankList?.ranks[0].head?.ten ?? "")
    self.seconduserhaireleventhImage.updateServerImage(rankList?.ranks[0].head?.eleven ?? "")
    self.seconduserhairtwelvethImage.updateServerImage(rankList?.ranks[0].head?.twelve ?? "")
    self.thirduserhairfirstImage.updateServerImage(rankList?.ranks[2].head?.one ?? "")
    self.thirduserhairsecondImage.updateServerImage(rankList?.ranks[2].head?.two ?? "")
    self.thirduserhairthirdImage.updateServerImage(rankList?.ranks[2].head?.three ?? "")
    self.thirduserhairfourthImage.updateServerImage(rankList?.ranks[2].head?.four ?? "")
    self.thirduserhairfifthImage.updateServerImage(rankList?.ranks[2].head?.five ?? "")
    self.thirduserhairsixthImage.updateServerImage(rankList?.ranks[2].head?.six ?? "")
    self.thirduserhairseventhImage.updateServerImage(rankList?.ranks[2].head?.seven ?? "")
    self.thirduserhaireighthImage.updateServerImage(rankList?.ranks[2].head?.eight ?? "")
    self.thirduserhairninethImage.updateServerImage(rankList?.ranks[2].head?.nine ?? "")
    self.thirduserhairtenthImage.updateServerImage(rankList?.ranks[2].head?.ten ?? "")
    self.thirduserhaireleventhImage.updateServerImage(rankList?.ranks[2].head?.eleven ?? "")
    self.thirduserhairtwelvethImage.updateServerImage(rankList?.ranks[2].head?.twelve ?? "")
  }
}
// MARK: - UITableViewDelegate, DataSource
extension RankingCollectionViewCell: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 84
  }
}
extension RankingCollectionViewCell: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let rankCount = self.rankList?.ranks.count ?? 0
    return rankCount-3
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let rankingCell = tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.identifier, for: indexPath) as? RankingTableViewCell else { return UITableViewCell() }
    rankingCell.userNameLabel.setupLabel(text: rankList?.ranks[indexPath.row+3].nickname ?? "", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    rankingCell.rankingLabel.setupLabel(text: "\(rankList?.ranks[indexPath.row+3].rank ?? 0)등", color: .hackerBlack, font: .subtitleMedium(ofSize: 20))
    rankingCell.usercommitLabel.setupLabel(text: "\(rankList?.ranks[indexPath.row+3].commitCount ?? 0) 커밋", color: .hackerBlack, font: .subtitleRegular(ofSize: 12))
    rankingCell.userhairfirstImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.one ?? "")
    rankingCell.userhairsecondImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.two ?? "")
    rankingCell.userhairthirdImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.three ?? "")
    rankingCell.userhairfourthImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.four ?? "")
    rankingCell.userhairfifthImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.five ?? "")
    rankingCell.userhairsixthImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.six ?? "")
    rankingCell.userhairseventhImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.seven ?? "")
    rankingCell.userhaireighthImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.eight ?? "")
    rankingCell.userhairninethImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.nine ?? "")
    rankingCell.userhairtenthImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.ten ?? "")
    rankingCell.userhaireleventhImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.eleven ?? "")
    rankingCell.userhairtwelvethImage.updateServerImage(rankList?.ranks[indexPath.row+3].head?.twelve ?? "")
    rankingCell.awakeFromNib()
    rankingCell.selectionStyle = .none
    rankingCell.backgroundColor = .white
    return rankingCell
  }
}
