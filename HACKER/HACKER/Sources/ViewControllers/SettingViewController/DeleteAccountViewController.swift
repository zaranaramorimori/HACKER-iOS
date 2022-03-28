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
  
  private let goodbyeLabel = UILabel().then {
    $0.setupLabel(text: "정말\n탈퇴하시겠어요..?\n진챠..? 날 두고..?", color: .hackerBlack, font: .titleBold24)
    $0.numberOfLines = 3
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
    view.addSubviews([navigationBar, goodbyeLabel])
    navigationBar.iconLayout(logoImage: nil, rightImage: nil)
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
    goodbyeLabel.snp.makeConstraints { make in
      make.top.equalTo(self.navigationBar.snp.bottom).offset(9)
      make.leading.equalToSuperview().inset(24)
    }
  }
}
