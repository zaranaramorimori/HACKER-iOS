//
//  DeleteAccountViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/03/28.
//

import UIKit

class DeleteAccountViewController: UIViewController {
  
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
    view.addSubviews([navigationBar])
    navigationBar.iconLayout(logoImage: nil, rightImage: nil)
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
  }
}
