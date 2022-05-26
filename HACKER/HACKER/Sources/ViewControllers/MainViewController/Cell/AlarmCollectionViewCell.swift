//
//  AlarmCollectionViewCell.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/27.
//

import UIKit

class AlarmCollectionViewCell: UICollectionViewCell {
  static let identifier = "AlarmCollectionViewCell"
  
  let contentLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setStyle()
    layoutContentLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
    layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    return layoutAttributes
  }
  
}

extension AlarmCollectionViewCell {
  private func setStyle() {
    contentView.setBorder(borderColor: .hackerBlack, borderWidth: 3)
    contentView.setRounded(radius: 20)
  }
  
  private func layoutContentLabel() {
    contentView.add(contentLabel) { label in
      label.setupLabel(text: "", color: .hackerBlack, font: .bodyRegular(ofSize: 16))
      label.numberOfLines = 0
      label.snp.makeConstraints { make in
        make.edges.equalToSuperview().inset(18)
      }
    }
  }
}
