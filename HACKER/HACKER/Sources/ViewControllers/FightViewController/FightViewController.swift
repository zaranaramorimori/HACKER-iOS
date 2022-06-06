//
//  FightViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class FightViewController: UIViewController {
  
  // MARK: - Components
  
  var serverIngSeasons: SeasonResponse?
  
  private let navigationBar = HackerNavigationBar()
  private let emptyView = EmptyView()

  private let dividerLine = UIImageView().then {
    $0.image = UIImage(named: "sectionLine")
    $0.contentMode = .scaleToFill
  }
  
  private lazy var fightTableView = UITableView(frame: .zero, style: .grouped).then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .hackerWhite
    $0.separatorStyle = .none
    $0.sectionFooterHeight = 0
    $0.rowHeight = UITableView.automaticDimension
    $0.estimatedRowHeight = 254
    $0.register(FightTableViewCell.self, forCellReuseIdentifier: FightTableViewCell.identifier)
    
    if #available(iOS 15, *) {
      $0.sectionHeaderTopPadding = 0
    }
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
    ingSeasonWithAPI()
  }
  
  // MARK: - Custom Method
  
  private func configUI() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
    notificationView.isHidden = true
    emptyView.updateLabels(text: "아직 진행중인 세션이 없어요!", aigoSize: 24, nothingSize: 16)
  }
  
  private func setupAutoLayout() {
    view.addSubviews([navigationBar, dividerLine, emptyView, fightTableView, notificationView])
    notificationView.add(notificationViewLabel)
    navigationBar.iconLayout(isBack: false,
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
    fightTableView.snp.makeConstraints { make in
      make.top.equalTo(self.dividerLine.snp.bottom)
      make.leading.equalToSuperview().inset(24)
      make.bottom.equalTo(view.safeAreaLayoutGuide)
      make.centerX.equalToSuperview()
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
}

// MARK: - UITableViewDataSource
extension FightViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return serverIngSeasons?.seasons.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: FightTableViewCell.identifier) as? FightTableViewCell else { return UITableViewCell() }
    
    cell.backgroundColor = .hackerWhite
    cell.selectionStyle = .none
    cell.seasonId = serverIngSeasons?.seasons[indexPath.section].seasonID
    cell.logoImage.updateServerImage(serverIngSeasons?.seasons[indexPath.section].imageURL ?? "")
    cell.nameLabel.text = serverIngSeasons?.seasons[indexPath.section].agency
    cell.titleLabel.text = serverIngSeasons?.seasons[indexPath.section].title
    cell.dateLabel.text = serverIngSeasons?.seasons[indexPath.section].duration
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let seasonId = serverIngSeasons?.seasons[indexPath.section].seasonID ?? 0
    seasonTeamInfoWithAPI(seasonId: seasonId)
  }
}

// MARK: - UITableViewDelegate
extension FightViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    var headerView = UIView()
    switch section {
    case 0:
      headerView = FightTableViewHeader()
      return headerView
    default:
      headerView.backgroundColor = .clear
      return headerView
    }
    
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 0:
      return 40
    default:
      return 24
    }
  }
}

// MARK: - Network
extension FightViewController {
  func ingSeasonWithAPI() {
    LoadingHUD.show()
    FightAPI.shared.ingSeason { response in
      LoadingHUD.hide()
      switch response {
      case .success(let data):
        if let seasons = data as? SeasonResponse {
          self.serverIngSeasons = seasons
          if seasons.seasons.isEmpty {
            self.fightTableView.isHidden = true
          }
          self.fightTableView.reloadData()
        }
      case .requestErr(let message):
        print("ingSeasonWithAPI - requestErr: \(message)")
      case .pathErr:
        print("ingSeasonWithAPI - pathErr")
      case .serverErr:
        print("ingSeasonWithAPI - serverErr")
      case .networkFail:
        print("ingSeasonWithAPI - networkFail")
      }
    }
  }
  
  func seasonTeamInfoWithAPI(seasonId: Int) {
    LoadingHUD.show()
    FightAPI.shared.seasonTeamInfo(seasonId: seasonId) { response in
      LoadingHUD.hide()
      switch response {
      case .success(let data):
        if let teams = data as? SeasonTeamResponse {
          let nextVC = RankingViewController()
          nextVC.serverSeasonTeamInfo = teams
          self.navigationController?.pushViewController(nextVC, animated: true)
        }
      case .requestErr(let message):
        print("seasonTeamInfoWithAPI - requestErr: \(message)")
      case .pathErr:
        print("seasonTeamInfoWithAPI - pathErr")
      case .serverErr:
        print("seasonTeamInfoWithAPI - serverErr")
      case .networkFail:
        print("seasonTeamInfoWithAPI - networkFail")
      }
    }
  }
}
