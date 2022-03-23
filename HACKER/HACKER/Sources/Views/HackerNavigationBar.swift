//
//  HackerNavigationBar.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/03/24.
//

import Foundation
import SnapKit
import Then

/*
 공통으로 사용할 수 있도록 만들어둔 네비게이션 바 입니다.
 
 1) HackerNavigationBar에는 공통으로 필요한 요소들을 구현해둔 상태에요.
 2) 해당 ViewController로 가서 HackerNavigationBar를 상속받은 UIView 생성 (ex: navigationBar)
 3) navigationBar.popViewController = { self.navigationController?.popViewController(animated: true) } 를 추가해요.
 4) func iconLayout(logoImage: UIImage, rightImage: UIImage) 함수를 이용하여 가운데 로고와 오른쪽 아이템을 바꿔주세요.
 */

class HackerNavigationBar: UIView {
  
  // MARK: - Properties
  
  var popViewController: (() -> Void)?
  
  private let backButton = UIButton().then {
    $0.setImage(UIImage(named: "backBtn"), for: .normal)
    $0.addTarget(self, action: #selector(touchBackButton(_:)), for: .touchUpInside)
    $0.isUserInteractionEnabled = true
  }
  
  private let logoButton = UIButton().then {
    $0.addTarget(self, action: #selector(touchLogoButton(_:)), for: .touchUpInside)
  }
  
  private let rightButton = UIButton().then {
    $0.addTarget(self, action: #selector(touchRightButton(_:)), for: .touchUpInside)
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
    backgroundColor = .white
  }
  
  private func setupAutoLayout() {
    addSubviews([backButton, logoButton])
    
    backButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(18)
      make.centerY.equalToSuperview()
    }
    
    logoButton.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.centerX.equalToSuperview()
      make.width.equalTo(104)
    }
    
    rightButton.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.trailing.equalToSuperview().inset(24)
    }
  }
  
  func iconLayout(logoImage: UIImage, rightImage: UIImage) {
    logoButton.setImage(logoImage, for: .normal)
    rightButton.setImage(rightImage, for: .normal)
  }
  
  // MARK: - @objc
  
  @objc func touchBackButton(_ sender: UIButton) {
    popViewController?()
  }
  
  @objc func touchLogoButton(_ sender: UIButton) {
    print("touchLogoButton")
  }
  
  @objc func touchRightButton(_ sender: UIButton) {
    print("touchRightButton")
  }
}
