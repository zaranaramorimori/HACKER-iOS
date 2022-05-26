//
//  AlarmCollectionViewCell.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/27.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
  static let identifier = "AlarmCollectionViewCell"
  
  private let containerView = UIView()
  let contentLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension AlarmTableViewCell {
  private func layout() {
    layoutContainerView()
    layoutContentLabel()
  }
  
  private func layoutContainerView() {
    contentView.add(containerView) { view in
      view.setBorder(borderColor: .hackerBlack, borderWidth: 3)
      view.setRounded(radius: 20)
      view.snp.makeConstraints { make in
        make.top.leading.trailing.equalToSuperview()
        make.bottom.equalToSuperview().inset(8)
      }
    }
  }
  
  private func layoutContentLabel() {
    contentView.add(contentLabel) { label in
      label.setupLabel(text: "", color: .hackerBlack, font: .bodyRegular(ofSize: 16))
      label.numberOfLines = 0
      label.snp.makeConstraints { make in
        make.edges.equalTo(self.containerView).inset(18)
      }
    }
  }
}
