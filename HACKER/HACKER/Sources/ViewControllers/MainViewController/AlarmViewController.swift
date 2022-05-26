//
//  AlarmViewController.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/26.
//

import UIKit

class AlarmViewController: UIViewController {
  
  // MARK: - Properties
  private var pushLogData: [PushLog]?
  
  // MARK: - Components
  private let navigationBar = HackerNavigationBar()
  private lazy var alarmTableView: UITableView = { createAlarmTableView() }()
  private let emptyView = UIStackView()
  private let emptyImage = UIImageView()
  private let emptyTitle = UILabel()
  private let emptyDescription = UILabel()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setStyle()
    layout()
    attribute()
    getAlarmList()
  }
}

// MARK: - UI
extension AlarmViewController {
  private func createAlarmTableView() -> UITableView {
    let tableView = UITableView()
    
    tableView.backgroundColor = .clear
    tableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
    return tableView
  }
  
  private func setStyle() {
    view.backgroundColor = .hackerWhite
    self.tabBarController?.tabBar.isHidden = true
  }
  
  private func layout() {
    layoutNavigationBar()
  }
  
  private func attribute() {
    alarmTableView.delegate = self
    alarmTableView.dataSource = self
    alarmTableView.register(AlarmTableViewCell.self, forCellReuseIdentifier: AlarmTableViewCell.identifier)
  }
  
  private func layoutNavigationBar() {
    view.addSubview(navigationBar)
    navigationBar.iconLayout(isBack: true, logoImage: UIImage(named: "alarmIcon"), rightImage: nil)
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
  }
  
  private func layoutAlarmTableView() {
    self.view.add(alarmTableView) {
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.navigationBar.snp.bottom).offset(10)
        make.leading.trailing.equalToSuperview().inset(24)
        make.bottom.equalToSuperview()
      }
    }
  }
  
  private func layoutEmptyView() {
    emptyImage.image = UIImage(named: "logoIcon")
    emptyTitle.setupLabel(text: "아이고!", color: .hackerBlack, font: .titleBold(ofSize: 24))
    emptyDescription.setupLabel(text: "아직 아무 소식도 알려드릴 게 없어요!", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
    
    emptyView.addArrangedSubview(emptyImage)
    emptyView.addArrangedSubview(emptyTitle)
    emptyView.addArrangedSubview(emptyDescription)
    
    emptyView.alignment = .center
    emptyView.axis = .vertical
    emptyView.alpha = 0.3
    
    emptyView.setCustomSpacing(10, after: emptyImage)
    
    view.addSubview(emptyView)
    emptyView.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
}

// MARK: - Custom Methods
extension AlarmViewController {
  private func getAlarmList() {
    PushAPI.shared.fetchPushList { response in
      switch response {
      case .success(let data):
        if let pushInfo = data as? PushResponse {
          if let logs = pushInfo.logs {
            if logs.isEmpty {
              self.layoutEmptyView()
            } else {
              self.pushLogData = pushInfo.logs
              self.layoutAlarmTableView()
            }
          }
        }
      case .requestErr(let status):
        print("userNicknameWithAPI - requestErr: \(status)")
        self.layoutEmptyView()
      case .pathErr:
        print("userNicknameWithAPI - pathErr")
        self.layoutEmptyView()
      case .serverErr:
        print("userNicknameWithAPI - serverErr")
        self.layoutEmptyView()
      case .networkFail:
        print("userNicknameWithAPI - networkFail")
        self.layoutEmptyView()
      }
    }
  }
}

// MARK: - UITableViewDataSource
extension AlarmViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return pushLogData?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pushLogData?[section].content.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: AlarmTableViewCell.identifier, for: indexPath) as? AlarmTableViewCell else { return UITableViewCell() }
    
    cell.contentLabel.text = pushLogData?[indexPath.section].content[indexPath.row]
    
    return cell
  }
}

// MARK: - UITableViewDelegate
extension AlarmViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let dateLabel = UILabel()
    
    dateLabel.frame = CGRect(x: 5, y: -8, width: tableView.frame.width, height: 30)
    dateLabel.setupLabel(text: pushLogData?[section].date ?? "", color: .hackerBlack, font: .titleBold(ofSize: 16))
    
    let headerView = UIView()
    headerView.addSubview(dateLabel)
    
    return headerView
  }
}
