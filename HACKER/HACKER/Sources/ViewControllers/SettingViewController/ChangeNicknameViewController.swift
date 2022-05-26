//
//  ChangeNicknameViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/26.
//

import UIKit
import SnapKit
import Then

class ChangeNicknameViewController: NicknameViewController {
  
  // MARK: - Components
  private let popButton = UIButton().then {
      $0.setBackgroundImage(UIImage(named: "backButtonIcon"), for: .normal)
      $0.addTarget(self, action: #selector(touchPopButton(_:)), for: .touchUpInside)
      $0.isUserInteractionEnabled = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAutoLayout()
  }
  
  // MARK: - Custom Method
  private func setupAutoLayout() {
    self.view.add(popButton)
    popButton.snp.makeConstraints { make in
      make.top.equalTo(self.view.safeAreaLayoutGuide).inset(16)
      make.leading.equalToSuperview().inset(24)
    }
  }
  
  // MARK: - @objc
  
  @objc func touchPopButton(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  
}
