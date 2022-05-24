//
//  OpenSourceViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/24.
//

import UIKit
import SnapKit
import Then

class OpenSourceViewController: UIViewController {
    
    // MARK: - Components
    private let navigationBar = HackerNavigationBar()
    private lazy var openSourceTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .hackerWhite
        $0.separatorStyle = .none
        $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        if #available(iOS 15, *) {
            $0.sectionHeaderTopPadding = 0
        }
    }
    
    private let openSourceTitles = ["Moya", "SwiftLint", "Kingfisher",
                                 "Snapkit", "Then"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupAutoLayout()
    }
    
    // MARK: - Custom Method
  
  private func configUI() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
    self.tabBarController?.tabBar.isHidden = true
  }
    
    private func setupAutoLayout() {
        view.addSubviews([navigationBar, openSourceTableView])
      navigationBar.iconLayout(isBack: true, logoImage: UIImage(named: "settingsIcon"), rightImage: nil)
        navigationBar.popViewController = {
            self.navigationController?.popViewController(animated: true)
        }
        navigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(72)
        }
      openSourceTableView.snp.makeConstraints { make in
            make.top.equalTo(self.navigationBar.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
    }
  
  func openURL(link: URL) {
    if UIApplication.shared.canOpenURL(link) {
      UIApplication.shared.open(link, options: [:], completionHandler: nil)
    }
  }
}

// MARK: - UITableViewDataSource
extension OpenSourceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return openSourceTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.titleLabel.text = openSourceTitles[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      switch indexPath.section {
      case 0: openURL(link: URL(string: Const.URL.moyaURL)!)
      case 1: openURL(link: URL(string: Const.URL.swiftLintURL)!)
      case 2: openURL(link: URL(string: Const.URL.kingfisherURL)!)
      case 3: openURL(link: URL(string: Const.URL.snapkitURL)!)
      case 4: openURL(link: URL(string: Const.URL.thenURL)!)
      default: print("default!")
      }
    }
}

// MARK: - UITableViewDelegate
extension OpenSourceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * (60/812)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
