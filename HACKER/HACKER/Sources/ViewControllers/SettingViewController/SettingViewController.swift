//
//  SettingViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/03/24.
//

import UIKit
import SnapKit
import Then

class SettingViewController: UIViewController {
    
    // MARK: - Components
    private let navigationBar = HackerNavigationBar()
    private lazy var settingsTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .hackerWhite
        $0.separatorStyle = .none
        $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        if #available(iOS 15, *) {
            $0.sectionHeaderTopPadding = 0
        }
    }
    
    private let settingTitles = ["닉네임 변경", "이용약관", "오픈소스 라이선스",
                                 "만든 사람들", "로그아웃", "서비스 탈퇴"]
    
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
        view.addSubviews([navigationBar, settingsTableView])
      navigationBar.iconLayout(isBack: true, logoImage: UIImage(named: "settingsIcon"), rightImage: nil)
        navigationBar.popViewController = {
            self.navigationController?.popViewController(animated: true)
        }
        navigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(72)
        }
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(self.navigationBar.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource
extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.titleLabel.text = settingTitles[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: 각 셀을 클릭하면 해당 뷰컨으로 push 해주기
        print(indexPath.section)
    }
}

// MARK: - UITableViewDelegate
extension SettingViewController: UITableViewDelegate {
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
