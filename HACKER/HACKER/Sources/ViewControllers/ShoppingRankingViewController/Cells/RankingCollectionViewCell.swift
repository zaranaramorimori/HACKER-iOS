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
  let firstUserNameLabel = UILabel()
  let firstUserCommitLabel = UILabel()
  let secondContainerView = UIView()
  let secondUser = UIImageView()
  let secondUserImage = UIImageView()
  let seconduserhairfirstImage = UIImageView()
  let secondUserNameLabel = UILabel()
  let secondUserCommitLabel = UILabel()
  let thirdContainerView = UIView()
  let thirdUser = UIImageView()
  let thirdUserImage = UIImageView()
  let thirduserhairfirstImage = UIImageView()
  let thirdUserNameLabel = UILabel()
  let thirdUserCommitLabel = UILabel()
  let separateView = UIView()
  let rankingTableView = UITableView()
  let myRankView = UIView()
  let myRankLabel = UILabel()
  let myNameLabel = UILabel()
  let myCommitLabel = UILabel()
  let shortCutButton = UIButton()
  
  var rankList: RankingResponse?
  let screenWidth = UIScreen.main.bounds.width-48
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    register()
    attribute()
    layout()
    self.contentView.bringSubviewToFront(myRankView)
    self.contentView.sendSubviewToBack(rankingTableView)
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
    layoutFirstUserNameLabel()
    layoutFirstUserCommitLabel()
    layoutSecondContainerView()
    layoutSecondUser()
    layoutSecondUserImage()
    layoutSecondUserFirstHairImage()
    layoutSecondUserNameLabel()
    layoutSecondUserCommitLabel()
    layoutThirdContainerView()
    layoutThirdUser()
    layoutThirdUserImage()
    layoutThirdUserFirstHairImage()
    layoutThirdUserNameLabel()
    layoutThirdUserCommitLabel()
    layoutSeparateView()
    layoutRankingTableView()
    layoutMyRankView()
    layoutMyrankLabel()
    layoutMyNameLabel()
    layoutMyCommitLabel()
    layoutShortCutButton()
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
        make.top.leading.trailing.equalToSuperview()
        make.bottom.equalTo(self.contentView.safeAreaLayoutGuide).offset(-68)
      }
    }
  }
  func layoutMyRankView() {
    self.contentView.add(myRankView) {
      $0.backgroundColor = .hackerWhite
      $0.layer.cornerRadius = 10
      $0.setBorder(borderColor: .hackerBlack, borderWidth: 3)
      let tapGesture = UITapGestureRecognizer(target: self,
                                              action: #selector(self.myrankingViewClicked))
      $0.addGestureRecognizer(tapGesture)
      $0.snp.makeConstraints { make in
        make.bottom.equalTo(self.contentView.safeAreaLayoutGuide).offset(-10)
        make.leading.equalToSuperview().offset(24)
        make.centerX.equalToSuperview()
        make.height.equalTo(58)
      }
    }
  }
  func layoutMyrankLabel() {
    self.myRankView.add(myRankLabel) {
      $0.snp.makeConstraints { make in
        make.leading.equalTo(self.myRankView).offset(30)
        make.centerY.equalToSuperview()
      }
    }
  }
  func layoutMyNameLabel() {
    self.myRankView.add(myNameLabel) {
      $0.snp.makeConstraints { make in
        make.top.equalToSuperview().offset(7)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutMyCommitLabel() {
    self.myRankView.add(myCommitLabel) {
      $0.snp.makeConstraints { make in
        make.bottom.equalToSuperview().offset(-11)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutShortCutButton() {
    self.myRankView.add(shortCutButton) {
      $0.isHidden = true
      $0.setupButton(title: "바로가기", color: .hackerBlack, font: .btnText(ofSize: 20), backgroundColor: .clear, state: .normal, radius: 0)
      $0.snp.makeConstraints { make in
        make.trailing.equalToSuperview().offset(-19)
        make.centerY.equalToSuperview()
      }
    }
  }
  @objc func myrankingViewClicked() {
    print("myrankingViewClicked")
  }
  func updateServerData() {
    self.firstUserNameLabel.setupLabel(text: rankList?.ranks[1].nickname ?? "", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    self.firstUserCommitLabel.setupLabel(text: "\(rankList?.ranks[1].commitCount ?? 0) 커밋", color: .hackerBlack, font: .subtitleRegular(ofSize: 12))
    self.secondUserNameLabel.setupLabel(text: rankList?.ranks[0].nickname ?? "", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    self.secondUserCommitLabel.setupLabel(text: "\(rankList?.ranks[0].commitCount ?? 0) 커밋", color: .hackerBlack, font: .subtitleRegular(ofSize: 12))
    self.thirdUserNameLabel.setupLabel(text: rankList?.ranks[2].nickname ?? "", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    self.thirdUserCommitLabel.setupLabel(text: "\(rankList?.ranks[2].commitCount ?? 0) 커밋", color: .hackerBlack, font: .subtitleRegular(ofSize: 12))
    self.firstuserhairfirstImage.updateServerImage(rankList?.ranks[1].head ?? "")
    self.seconduserhairfirstImage.updateServerImage(rankList?.ranks[0].head ?? "")
    self.thirduserhairfirstImage.updateServerImage(rankList?.ranks[2].head ?? "")
    self.myRankLabel.setupLabel(text: "\(rankList?.myRank?.rank ?? 0)등", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    self.myNameLabel.setupLabel(text: "\(rankList?.myRank?.nickname ?? "")", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    self.myCommitLabel.setupLabel(text: "\(rankList?.myRank?.commitCount ?? 0)커밋", color: .hackerBlack, font: .subtitleRegular(ofSize: 12))
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
    rankingCell.userhairfirstImage.updateServerImage(rankList?.ranks[indexPath.row+3].head ?? "")
    rankingCell.awakeFromNib()
    rankingCell.selectionStyle = .none
    rankingCell.backgroundColor = .white
    return rankingCell
  }
}
