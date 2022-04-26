//
//  TabbarCollectionViewCell.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/26.
//

import UIKit

import SnapKit
import Then

// MARK: - TabbarCollectionViewCell
class TabbarCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Components
  let tabLabel = UILabel()
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
}
// MARK: - Extension
extension TabbarCollectionViewCell {
  func layout() {
    layoutTabLabel()
  }
  func layoutTabLabel() {
    self.contentView.add(tabLabel) {
      $0.snp.makeConstraints { make in
        make.centerX.centerY.equalToSuperview()
      }
    }
  }
  func updateLabel(name: String, color: UIColor) {
    self.tabLabel.setupLabel(text: "\(name)", color: color, font: .btnText(ofSize: 24))
  }
}
