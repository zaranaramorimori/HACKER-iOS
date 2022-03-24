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
        $0.estimatedRowHeight = 100
        $0.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
//        $0.register(ThumbnailTVC.self, forCellReuseIdentifier: ThumbnailTVC.identifier)
        
        if #available(iOS 15.0, *) {
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
        view.addSubviews([navigationBar, settingsTableView])
        navigationBar.iconLayout(logoImage: UIImage(named: "settingIcon"), rightImage: nil)
        navigationBar.popViewController = {
            self.navigationController?.popViewController(animated: true)
        }
        navigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(56)
        }
    }
}

// MARK: - UITableViewDataSource
extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ThumbnailTVC.identifier) as? ThumbnailTVC else { return UITableViewCell() }
        cell.getCellConfigureAt(indexPath.row)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return HomeHeaderView()
//    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
