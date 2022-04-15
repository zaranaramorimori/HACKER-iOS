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
  let firstUserNameLabel = UILabel()
  let firstUserCommitLabel = UILabel()
  let secondContainerView = UIView()
  let secondUser = UIImageView()
  let secondUserImage = UIImageView()
  let secondUserNameLabel = UILabel()
  let secondUserCommitLabel = UILabel()
  let thirdContainerView = UIView()
  let thirdUser = UIImageView()
  let thirdUserImage = UIImageView()
  let thirdUserNameLabel = UILabel()
  let thirdUserCommitLabel = UILabel()
  let separateView = UIView()
  let rankingTableView = UITableView()
  
  let screenWidth = UIScreen.main.bounds.width-48
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    register()
    attribute()
    layout()
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
    layoutFirstUserNameLabel()
    layoutFirstUserCommitLabel()
    layoutSecondContainerView()
    layoutSecondUser()
    layoutSecondUserImage()
    layoutSecondUserNameLabel()
    layoutSecondUserCommitLabel()
    layoutThirdContainerView()
    layoutThirdUser()
    layoutThirdUserImage()
    layoutThirdUserNameLabel()
    layoutThirdUserCommitLabel()
    layoutSeparateView()
    layoutRankingTableView()
  }
  func layoutHeaderView() {
    headerView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 325)
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
    return 30
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let rankingCell = tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.identifier, for: indexPath) as? RankingTableViewCell else { return UITableViewCell() }
    rankingCell.awakeFromNib()
    rankingCell.selectionStyle = .none
    rankingCell.backgroundColor = .white
    return rankingCell
  }
}
