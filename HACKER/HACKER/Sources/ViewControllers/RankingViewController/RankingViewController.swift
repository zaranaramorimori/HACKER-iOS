//
//  RankingViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class RankingViewController: UIViewController {
  
  // MARK: - Components
  
  var serverSeasonTeamInfo: SeasonTeamResponse?
  
  private let navigationBar = HackerNavigationBar()
  private let emptyView = EmptyView()
  
  private let dividerLine = UIImageView().then {
    $0.image = UIImage(named: "sectionLine")
    $0.contentMode = .scaleToFill
  }
  
  private lazy var rankingTableView = UITableView(frame: .zero, style: .grouped).then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .hackerWhite
    $0.separatorStyle = .none
    $0.sectionFooterHeight = 0
    $0.rowHeight = UITableView.automaticDimension
    $0.estimatedRowHeight = 254
    $0.register(TeamRankingTableViewCell.self, forCellReuseIdentifier: TeamRankingTableViewCell.identifier)
    $0.register(RankingTableViewHeader.self, forHeaderFooterViewReuseIdentifier: RankingTableViewHeader.identifier)
    
    if #available(iOS 15, *) {
      $0.sectionHeaderTopPadding = 0
    }
  }
  
  private let myRankView = UIView().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 10
    $0.layer.borderWidth = 3
    $0.layer.borderColor = UIColor.hackerBlack.cgColor
  }
  
  var rankLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleMedium(ofSize: 16)
  }
  
  var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleMedium(ofSize: 16)
  }
  
  var commitLabel = UILabel().then {
    $0.textColor = .lightGray
    $0.font = .subtitleRegular(ofSize: 12)
  }
  
  private let shortCutButton = UIButton().then {
    $0.titleLabel?.font = .btnText(ofSize: 20)
//    $0.setTitle("바로가기", for: .normal)
    $0.setTitleColor(.hackerBlack, for: .normal)
    $0.addTarget(self, action: #selector(touchShortCutButton(_:)), for: .touchUpInside)
  }
  
  private let notificationView = UIView().then {
    $0.backgroundColor = .hackerBlack
    $0.layer.cornerRadius = 15
  }
  
  private let notificationViewLabel = UILabel().then {
    $0.setupLabel(text: "랭킹과 머리카락은 00:00시 정각에\n업데이트 됩니다.", color: .hackerWhite, font: .titleBold(ofSize: 16))
    $0.numberOfLines = 2
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    setupAutoLayout()
    updateMyTeam()
  }
  
  // MARK: - Custom Method
  
  private func configUI() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
    notificationView.isHidden = true
    emptyView.updateLabels(text: "아직 참여하는 팀이 없어요!", aigoSize: 24, nothingSize: 16)
    guard let noTeams = serverSeasonTeamInfo?.teams.isEmpty else { return }
    if noTeams {
      rankingTableView.isHidden = true
    }
  }
  
  private func setupAutoLayout() {
    view.addSubviews([navigationBar, dividerLine, emptyView, rankingTableView,
                      myRankView, rankLabel, nameLabel, commitLabel, shortCutButton, notificationView])
    notificationView.add(notificationViewLabel)
    navigationBar.iconLayout(isBack: true,
                             logoImage: UIImage(named: "fightMainIcon"),
                             rightImage: UIImage(named: "infoIconBlack"))
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.hideNotificationView = {
      self.notificationView.isHidden = !self.navigationBar.rightButton.isSelected
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
    dividerLine.snp.makeConstraints { make in
      make.top.equalTo(navigationBar.snp.bottom)
      make.leading.trailing.equalToSuperview()
    }
    emptyView.snp.makeConstraints { make in
      make.top.equalTo(dividerLine.snp.bottom)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(self.view.safeAreaLayoutGuide)
    }
    rankingTableView.snp.makeConstraints { make in
      make.top.equalTo(self.dividerLine.snp.bottom)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(view.safeAreaLayoutGuide)
    }
    myRankView.snp.makeConstraints { make in
      make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
      make.leading.trailing.equalToSuperview().inset(24)
      make.height.equalTo(58)
    }
    rankLabel.snp.makeConstraints { make in
      make.leading.equalTo(myRankView.snp.leading).inset(27)
      make.centerY.equalTo(myRankView)
    }
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(myRankView.snp.top).inset(7)
      make.centerX.equalTo(myRankView)
    }
    commitLabel.snp.makeConstraints { make in
      make.bottom.equalTo(myRankView.snp.bottom).inset(11)
      make.centerX.equalTo(myRankView)
    }
    shortCutButton.snp.makeConstraints { make in
      make.trailing.equalTo(myRankView.snp.trailing).inset(16)
      make.centerY.equalTo(myRankView)
    }
    
    notificationView.snp.makeConstraints { make in
      make.top.equalTo(navigationBar.rightButton.snp.bottom).offset(4)
      make.trailing.equalToSuperview().inset(24)
      make.width.equalTo(265)
      make.height.equalTo(72)
    }

    notificationViewLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
  }
  
  private func updateMyTeam() {
    rankLabel.text = "\(serverSeasonTeamInfo?.myTeam?.rank ?? 0) 등"
    nameLabel.text = serverSeasonTeamInfo?.myTeam?.name
    commitLabel.text = "\(serverSeasonTeamInfo?.myTeam?.commitCount ?? 0) 커밋"
  }
  
  // MARK: - @objc
  
  @objc func touchShortCutButton(_ sender: UIButton) {
    print("touchShortCutButton")
  }
  
  @objc func touchTableViewHeader(_ sender: UITapGestureRecognizer) {
    let teamId = serverSeasonTeamInfo?.teams.first?.teamID ?? 0
    teamDetailInfoWithAPI(teamId: teamId)
  }
  
}

// MARK: - UIGestureRecognizerDelegate
extension RankingViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    return true
  }
}

// MARK: - UITableViewDataSource
extension RankingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return (serverSeasonTeamInfo?.teams.count ?? 1) - 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamRankingTableViewCell.identifier) as? TeamRankingTableViewCell else { return UITableViewCell() }
    cell.backgroundColor = .hackerWhite
    cell.selectionStyle = .none
    cell.rankLabel.text = "\(serverSeasonTeamInfo?.teams[indexPath.section+1].rank ?? 0) 등"
    cell.nameLabel.text = serverSeasonTeamInfo?.teams[indexPath.section+1].name
    cell.commitLabel.text = "\(serverSeasonTeamInfo?.teams[indexPath.section+1].commitCount ?? 0) 커밋"
    cell.hairImage.updateServerImage(serverSeasonTeamInfo?.teams[indexPath.section+1].head ?? "")
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let teamId = serverSeasonTeamInfo?.teams[indexPath.section+1].teamID ?? 0
    teamDetailInfoWithAPI(teamId: teamId)
  }
}

// MARK: - UITableViewDelegate
extension RankingViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    switch section {
    case 0:
      let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchTableViewHeader(_:)))
      tapGesture.delegate = self
      
      guard let rankingTableViewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: RankingTableViewHeader.identifier) as? RankingTableViewHeader else {
        return UIView()
      }
      rankingTableViewHeader.nameLabel.text = serverSeasonTeamInfo?.teams.first?.name
      rankingTableViewHeader.commitLabel.text = "\(serverSeasonTeamInfo?.teams.first?.commitCount ?? 0) 커밋"
      rankingTableViewHeader.hairImage.updateServerImage(serverSeasonTeamInfo?.teams.first?.head ?? "")
      rankingTableViewHeader.addGestureRecognizer(tapGesture)
      return rankingTableViewHeader
    default:
      let headerView = UIView()
      headerView.backgroundColor = .lightGray
      return headerView
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 0:
      return 173
    default:
      return 1
    }
  }
}

// MARK: - Network
extension RankingViewController {
  func teamDetailInfoWithAPI(teamId: Int) {
    LoadingHUD.show()
    FightAPI.shared.teamDetailInfo(teamId: teamId) { response in
      LoadingHUD.hide()
      switch response {
      case .success(let data):
        if let teamInfo = data as? TeamDetailResponse {
          let nextVC = TeamViewController()
          nextVC.serverTeamDetailInfo = teamInfo
          nextVC.teamId = teamId
          self.navigationController?.pushViewController(nextVC, animated: true)
        }
      case .requestErr(let message):
        print("teamDetailInfoWithAPI - requestErr: \(message)")
      case .pathErr:
        print("teamDetailInfoWithAPI - pathErr")
      case .serverErr:
        print("teamDetailInfoWithAPI - serverErr")
      case .networkFail:
        print("teamDetailInfoWithAPI - networkFail")
      }
    }
  }
}
