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
        //    addSubviews([navigationBar])
        view.add(navigationBar)
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
