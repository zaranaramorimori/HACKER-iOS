//
//  CheckFriendViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/08.
//

import UIKit

import SnapKit
import Then

//MARK: - CheckFriendViewController
class CheckFriendViewController: UIViewController {
  
  // MARK: - Components
  let hackerImageView = UIImageView()
  let helloLabel = UILabel()
  let explainLabel = UILabel()
  let nextButton = UIButton()
  
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
    attribute()
  }
}

// MARK: - Extensions
extension CheckFriendViewController {
  func setBackground() {
      self.view.backgroundColor = .hackerWhite
      self.navigationController?.navigationBar.isHidden = true
  }
  func layout() {
    layoutHackerImageView()
    layoutHelloLabel()
    layoutExplainLabel()
    layoutNextButton()
  }
  func attribute() {
  }
  func layoutHackerImageView() {
    self.view.add(hackerImageView) {
      $0.image = UIImage(named: "logoIcon")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(32)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(100)
        $0.height.equalTo(100)
      }
    }
  }
  func layoutHelloLabel() {
    self.view.add(helloLabel) {
      $0.setupLabel(text: "추가하세요!", color: .hackerBlack, font: .titleBold(ofSize: 24))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.hackerImageView.snp.bottom).offset(16)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutExplainLabel() {
    self.view.add(explainLabel) {
      $0.setupLabel(text: "어떤 분을 추가할까요?", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.helloLabel.snp.bottom).offset(12)
        $0.centerX.equalToSuperview()
      }
    }
  }
  
  func layoutNextButton() {
    self.view.add(nextButton) {
      $0.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
      $0.setupButton(title: "다음", color: .hackerDarkGray, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
      $0.titleLabel?.textAlignment = .center
      $0.addTextSpacing(10)
      $0.addTarget(self, action: #selector(self.touchNextButton), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.bottom.equalToSuperview().offset(-39)
      }
    }
  }
  @objc func touchNextButton() {
    
  }
}
