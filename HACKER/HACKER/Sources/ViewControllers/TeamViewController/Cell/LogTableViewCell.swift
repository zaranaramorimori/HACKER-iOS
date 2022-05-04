//
//  LogTableViewCell.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class LogTableViewCell: UITableViewCell {

  static let identifier = "LogTableViewCell"
  
  // MARK: - UI
  var backgroundWithBorder = UIView().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 20
    $0.layer.borderWidth = 3
    $0.layer.borderColor = UIColor.hackerBlack.cgColor
  }
  
  var logLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleRegular(ofSize: 16)
    $0.numberOfLines = 0
    $0.textAlignment = .center
    $0.sizeToFit()
    $0.text = "대머리가 머리카락을 뽑아갔어요!"
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Method
  private func setupLayout() {
    addSubviews([backgroundWithBorder, logLabel])
    
    backgroundWithBorder.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    logLabel.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(20)
      make.leading.equalToSuperview().inset(20)
    }
  }
}
