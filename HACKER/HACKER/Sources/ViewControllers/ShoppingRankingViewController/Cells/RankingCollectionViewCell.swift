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
  
  // MARK: - Properties
  var rankList: RankingResponse?
  let screenWidth = UIScreen.main.bounds.width - 48
  
  // MARK: - Components
  let headerView = UIView()
  let headerStackView = UIStackView()
  var containerViews = [UIView]()
  var rankNumImageViews = [UIImageView]()
  var userImageViews = [UIImageView]()
  var hairImageViews = [UIImageView]()
  var nameLabels = [UILabel]()
  var commitLabel = [UILabel]()
  
  let separateView = UIView()
  let rankingTableView = UITableView()
  let myRankView = UIView()
  let myRankLabel = UILabel()
  let myNameLabel = UILabel()
  let myCommitLabel = UILabel()
  let shortCutButton = UIButton()
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    register()
    attribute()
    layout {
      self.updateServerData()
    }
    contentView.bringSubviewToFront(myRankView)
    contentView.sendSubviewToBack(rankingTableView)
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
  func layout(completion: @escaping () -> Void) {
    layoutHeaderView()
    layoutHeaderStackView()
    layoutContainerViews()
    layoutRankNumImageViews()
    layoutUserImageViews()
    layoutHairImageViews()
    layoutNameLabels()
    layoutCommitLabels()
    
    layoutSeparateView()
    layoutRankingTableView()
    layoutMyRankView()
    layoutMyrankLabel()
    layoutMyNameLabel()
    layoutMyCommitLabel()
    layoutShortCutButton()
    
    completion()
  }
  func layoutHeaderView() {
    headerView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 325)
    headerView.backgroundColor = .hackerWhite
  }
  func layoutHeaderStackView() {
    headerStackView.axis = .horizontal
    headerStackView.distribution = .fillEqually
    headerStackView.alignment = .center
    headerStackView.spacing = 0
    self.headerView.add(headerStackView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints { make in
        make.leading.trailing.equalToSuperview().inset(24)
        make.top.centerX.equalToSuperview()
        make.height.equalTo(325)
      }
    }
  }
  func layoutContainerViews() {
    for index in 0..<3 {
      containerViews.append(UIView())
      headerStackView.addArrangedSubview(containerViews[index])
      containerViews[index].snp.makeConstraints { make in
        make.width.equalTo(self.screenWidth/3)
        make.height.equalTo(325)
      }
    }
  }
  func layoutRankNumImageViews() {
    let rankNumImageNames = ["rankingSecondImage", "rankingFirstImage", "rankingThirdImage"]
    
    for index in 0..<3 {
      rankNumImageViews.append(UIImageView())
      containerViews[index].addSubview(rankNumImageViews[index])
      rankNumImageViews[index].image = UIImage(named: rankNumImageNames[index])
      rankNumImageViews[index].snp.makeConstraints { make in
        make.top.equalToSuperview().offset(index == 1 ? 22 : 96)
        make.centerX.equalToSuperview()
      }
    }
  }
  
  func layoutUserImageViews() {
    for index in 0..<3 {
      userImageViews.append(UIImageView())
      containerViews[index].addSubview(userImageViews[index])
      userImageViews[index].image = UIImage(named: "userCharacterImage")
      userImageViews[index].contentMode = .scaleAspectFit
      userImageViews[index].snp.makeConstraints { make in
        make.top.equalTo(self.rankNumImageViews[index].snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  
  func layoutHairImageViews() {
    for index in 0..<3 {
      hairImageViews.append(UIImageView())
      containerViews[index].addSubview(hairImageViews[index])
      hairImageViews[index].contentMode = .scaleAspectFit
      hairImageViews[index].snp.makeConstraints { make in
        make.top.equalTo(self.rankNumImageViews[index].snp.bottom)
        make.centerX.equalToSuperview()
        make.width.equalTo(101)
        make.height.equalTo(110)
      }
    }
  }
  
  func layoutNameLabels() {
    for index in 0..<3 {
      nameLabels.append(UILabel())
      containerViews[index].addSubview(nameLabels[index])
      nameLabels[index].setupLabel(text: "", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      nameLabels[index].snp.makeConstraints { make in
        make.top.equalTo(self.userImageViews[index].snp.bottom).offset(8)
        make.centerX.equalToSuperview()
      }
    }
  }
  
  func layoutCommitLabels() {
    for index in 0..<3 {
      commitLabel.append(UILabel())
      containerViews[index].addSubview(commitLabel[index])
      commitLabel[index].setupLabel(text: "0 커밋", color: .hackerBlack, font: .bodyRegular(ofSize: 12))
      commitLabel[index].snp.makeConstraints { make in
        make.top.equalTo(self.nameLabels[index].snp.bottom)
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
    if let rankList = rankList?.ranks {
      let rankOrder = [1, 0, 2]
      for index in 0..<3 {
        nameLabels[index].text = rankList[rankOrder[index]].nickname
        commitLabel[index].text = "\(rankList[rankOrder[index]].commitCount) 커밋"
        hairImageViews[index].updateServerImage(rankList[rankOrder[index]].head ?? "")
      }
    }
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
