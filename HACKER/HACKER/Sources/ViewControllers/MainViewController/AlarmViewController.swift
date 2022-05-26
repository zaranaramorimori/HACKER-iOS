//
//  AlarmViewController.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/26.
//

import UIKit

class AlarmViewController: UIViewController {
  
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
    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
    return tableView
  }
  
  private func setStyle() {
    view.backgroundColor = .hackerWhite
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
  
  private func layoutAlarmCollectionView() {
    self.view.add(alarmTableView) {
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.navigationBar.snp.bottom).offset(10)
        make.leading.trailing.equalToSuperview().inset(24)
        make.bottom.equalToSuperview()
      }
    }
  }
  
  private func layoutEmptyView() {
    
  }
}

// MARK: - Custom Methods
extension AlarmViewController {
  private func getAlarmList() {
    layoutAlarmCollectionView()
  }
}

// MARK: - UITableViewDataSource
extension AlarmViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: AlarmTableViewCell.identifier, for: indexPath) as? AlarmTableViewCell else { return UITableViewCell() }
    
    cell.contentLabel.text = "대머리가 머리카락을 뽑아갔어요! 대머리가 머리카락을 뽑아갔어요!"
    
    return cell
  }
}

// MARK: - UITableViewDelegate
extension AlarmViewController: UITableViewDelegate {
  
}
