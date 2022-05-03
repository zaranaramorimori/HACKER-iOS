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
  
  private let navigationBar = HackerNavigationBar()
  
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
//    $0.register(FightTableViewHeader.self, forHeaderFooterViewReuseIdentifier: FightTableViewHeader.identifier)
    
    if #available(iOS 15, *) {
      $0.sectionHeaderTopPadding = 0
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    setupAutoLayout()
  }
  
  // MARK: - Custom Method
  
  private func configUI() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
  }
  
  private func setupAutoLayout() {
    view.addSubviews([navigationBar, dividerLine, rankingTableView])
    navigationBar.iconLayout(isBack: true,
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
    rankingTableView.snp.makeConstraints { make in
      make.top.equalTo(self.dividerLine.snp.bottom)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  // MARK: - @objc
  
  @objc func infoButtonClicked(_ sender: UIButton) {
    print("info clicked")
  }
  
}

// MARK: - UITableViewDataSource
extension RankingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamRankingTableViewCell.identifier) as? TeamRankingTableViewCell else { return UITableViewCell() }
    
    cell.backgroundColor = .hackerWhite
    cell.selectionStyle = .none
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // TODO: 각 셀을 클릭하면 해당 뷰컨으로 push 해주기
    print(indexPath.section)
  }
}

// MARK: - UITableViewDelegate
extension RankingViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    switch section {
    case 0:
      guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FightTableViewHeader.identifier) as? FightTableViewHeader else { return UIView() }
      return headerView
    default:
      let headerView = UIView()
      headerView.backgroundColor = .lightGray
      return headerView
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 0:
      return 40
    default:
      return 1
    }
  }
}
