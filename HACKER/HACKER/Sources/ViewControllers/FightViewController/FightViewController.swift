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
  }
  
  private func setupAutoLayout() {
    view.addSubviews([navigationBar, dividerLine, fightTableView])
    navigationBar.iconLayout(isBack: false,
                             logoImage: UIImage(named: "fightMainIcon"),
                             rightImage: UIImage(named: "infoIconBlack"))
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
    dividerLine.snp.makeConstraints { make in
      make.top.equalTo(navigationBar.snp.bottom)
      make.leading.trailing.equalToSuperview()
    }
    fightTableView.snp.makeConstraints { make in
      make.top.equalTo(self.dividerLine.snp.bottom)
      make.leading.equalToSuperview().inset(24)
      make.bottom.equalTo(view.safeAreaLayoutGuide)
      make.centerX.equalToSuperview()
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
    cell.nameLabel.text = serverIngSeasons?.seasons[indexPath.section].agency
    cell.titleLabel.text = serverIngSeasons?.seasons[indexPath.section].title
    cell.dateLabel.text = serverIngSeasons?.seasons[indexPath.section].duration
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // TODO: 각 셀을 클릭하면 해당 뷰컨으로 push 해주기
    print(indexPath.section)
    let nextVC = RankingViewController()
    navigationController?.pushViewController(nextVC, animated: true)
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
    FightAPI.shared.ingSeason { response in
      switch response {
      case .success(let data):
        if let seasons = data as? SeasonResponse {
          self.serverIngSeasons = seasons
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
}
