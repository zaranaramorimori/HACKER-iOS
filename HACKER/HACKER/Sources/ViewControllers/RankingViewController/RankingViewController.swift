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
    $0.text = "145등"
  }
  
  var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleMedium(ofSize: 16)
    $0.text = "FILL-IN"
  }
  
  var commitLabel = UILabel().then {
    $0.textColor = .lightGray
    $0.font = .subtitleRegular(ofSize: 12)
    $0.text = "1500 커밋"
  }
  
  private let shortCutButton = UIButton().then {
    $0.titleLabel?.font = .btnText(ofSize: 20)
    $0.setTitle("바로가기", for: .normal)
    $0.setTitleColor(.hackerBlack, for: .normal)
    $0.addTarget(self, action: #selector(touchShortCutButton(_:)), for: .touchUpInside)
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
    view.addSubviews([navigationBar, dividerLine, rankingTableView,
                      myRankView, rankLabel, nameLabel, commitLabel, shortCutButton])
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
      make.top.equalTo(nameLabel.snp.bottom)
      make.centerX.equalTo(myRankView)
    }
    shortCutButton.snp.makeConstraints { make in
      make.trailing.equalTo(myRankView.snp.trailing).inset(16)
      make.centerY.equalTo(myRankView)
    }
  }
  
  // MARK: - @objc
  
  @objc func touchShortCutButton(_ sender: UIButton) {
    print("touchShortCutButton")
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
    var headerView = UIView()
    switch section {
    case 0:
      headerView = RankingTableViewHeader()
      return headerView
    default:
      headerView = UIView()
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
