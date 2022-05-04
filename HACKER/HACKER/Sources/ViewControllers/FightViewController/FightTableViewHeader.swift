//
//  FightTableViewHeader.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class FightTableViewHeader: UITableViewHeaderFooterView {
  
  static let identifier = "FightTableViewHeader"
  
  // MARK: - UI
  
  private let ingLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .titleBold(ofSize: 16)
    $0.text = "진행중"
  }
  
  // MARK: - Init
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setupAutoLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Custom Method
  private func setupAutoLayout() {
    addSubviews([ingLabel])
    
    ingLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview()
      make.centerY.equalToSuperview()
    }
  }
  
  func setIngLabel(text: String) {
    ingLabel.text = text
  }
}
