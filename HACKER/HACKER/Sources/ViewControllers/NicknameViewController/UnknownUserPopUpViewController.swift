//
//  UnknownUserPopUpViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/02/20.
//

import UIKit

import SnapKit
import Then

// MARK: - UnknownUserPopUpViewController
class UnknownUserPopUpViewController: UIViewController {
  
  // MARK: - Components
  let backgroundView = UIView()
  let rectangleBackgroundView = UIView()
  let unknownUserLabel = UILabel()
  let tryagainButton = UIButton()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    layout()
  }
  
}
// MARK: - Extensions
extension UnknownUserPopUpViewController {
  func layout() {
    layoutBackGroundView()
    layoutRectangleBackground()
    layoutUnknownUserLabel()
    layoutTryAgainButton()
  }
  func setUI() {
    self.view.backgroundColor = .hackerWhite
  }
  func layoutBackGroundView() {
    self.view.add(backgroundView) {
      $0.backgroundColor = .hackerBackgroundBlack
      $0.snp.makeConstraints {
        $0.top.leading.trailing.bottom.equalToSuperview()
      }
    }
  }
  func layoutRectangleBackground() {
    self.backgroundView.add(rectangleBackgroundView) {
      $0.backgroundColor = .hackerWhite
      $0.setRounded(radius: 40)
      $0.snp.makeConstraints {
        $0.top.equalToSuperview().offset(282)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(306)
        $0.height.equalTo(212)
      }
    }
  }
  func layoutUnknownUserLabel() {
    self.rectangleBackgroundView.add(unknownUserLabel) {
      $0.setupLabel(text: "존재하지 않는 유저입니다.", color: .hackerBlack, font: .subtitleMedium16)
      $0.snp.makeConstraints {
        $0.top.equalToSuperview().offset(57)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutTryAgainButton() {
    self.rectangleBackgroundView.add(tryagainButton) {
      $0.setBackgroundImage(UIImage(named: "nextBtnBlack"), for: .normal)
      $0.setupButton(title: "다시 입력하기", color: .hackerWhite, font: .btnText32, backgroundColor: .clear, state: .normal, radius: 0)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.unknownUserLabel.snp.bottom).offset(51)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(258)
        $0.height.equalTo(60)
      }
    }
  }
}
