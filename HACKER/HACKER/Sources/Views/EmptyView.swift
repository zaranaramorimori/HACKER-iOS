//
//  EmptyView.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/05.
//

import Foundation
import SnapKit
import Then

/*
 공통으로 사용할 수 있도록 만들어둔 엠티뷰 입니다.
 
 1) EmptyView에는 공통으로 필요한 요소들을 구현해둔 상태에요.
 2) updateLabels(text: String, aigoSize: CGFloat, nothingSize: CGFloat)를 호출해서 text에 바꾸고 싶은 텍스트를, aigoSize에 아이고 폰트 사이즈를 넣으시면 됩니다.
 */

class EmptyView: UIView {
  
  // MARK: - Properties
  
  private let logoImage = UIImageView().then {
    $0.image = UIImage(named: "emptyLogo")
    $0.clipsToBounds = true
    $0.contentMode = .scaleAspectFit
  }
  
  private let aigoLabel = UILabel().then {
    $0.text = "아이고!"
    $0.textColor = .hackerDarkGray
    $0.font = .titleBold(ofSize: 24)
  }
  
  private let nothingLabel = UILabel().then {
    $0.text = "아직 진행중인 세션이 없어요!"
    $0.textColor = .hackerDarkGray
    $0.font = .subtitleMedium(ofSize: 16)
  }
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configUI()
    setupAutoLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configUI()
    setupAutoLayout()
  }
  
  // MARK: - Custom Method
  
  private func configUI() {
    backgroundColor = .hackerWhite
  }
  
  private func setupAutoLayout() {
    addSubviews([logoImage, aigoLabel, nothingLabel])
    
    logoImage.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.centerX.equalToSuperview()
    }
    
    aigoLabel.snp.makeConstraints { make in
      make.top.equalTo(logoImage.snp.bottom).offset(12)
      make.centerX.equalToSuperview()
    }
    
    nothingLabel.snp.makeConstraints { make in
      make.top.equalTo(aigoLabel.snp.bottom).offset(1)
      make.centerX.equalToSuperview()
    }
  }
  
  func updateLabels(text: String, aigoSize: CGFloat, nothingSize: CGFloat) {
    aigoLabel.font = .titleBold(ofSize: aigoSize)
    nothingLabel.font = .titleBold(ofSize: nothingSize)
    nothingLabel.text = text
  }
}
