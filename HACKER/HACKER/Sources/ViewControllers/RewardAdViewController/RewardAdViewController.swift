//
//  RewardAdViewController.swift
//  HACKER
//
//  Created by Danna Lee on 2022/03/26.
//

import UIKit

class RewardAdViewController: UIViewController {
  // MARK: - Properties
  let coinCount: Int = 10
  
  // MARK: - Componenets
  let coinStackView = UIStackView()
  let coinImageView = UIImageView()
  let coinCountLabel = UILabel()
  let watchAdButton = UIButton()
  let watchAdLabel = UILabel()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setBackground()
    setLayout()
  }
}

// MARK: - UI
extension RewardAdViewController {
  func setBackground() {
      view.backgroundColor = .white
      navigationController?.navigationBar.isHidden = true
  }
  
  func setLayout() {
    layoutCoinStackView()
    layoutCoinImageView()
    layoutCoinCountLabel()
    layoutWatchAdButton()
    layoutWatchAdLabel()
  }
  
  func layoutCoinStackView() {
    view.add(coinStackView) { stack in
      stack.alignment = .center
      stack.spacing = 7
      stack.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.top.equalTo(self.view.safeAreaLayoutGuide).offset(100)
        make.height.equalTo(35)
      }
    }
  }
  
  func layoutCoinImageView() {
    coinStackView.addArrangedSubview(coinImageView)
    coinImageView.image = UIImage(named: "logoIcon")
    coinImageView.contentMode = .scaleAspectFit
    coinImageView.snp.makeConstraints { make in
      make.width.equalTo(35)
    }
  }
  
  func layoutCoinCountLabel() {
    coinStackView.addArrangedSubview(coinCountLabel)
    coinCountLabel.setupLabel(text: "x\(coinCount)", color: .hackerBlack, font: .btnText(ofSize: 32))
  }
  
  func layoutWatchAdButton() {
    view.add(watchAdButton) { button in
      button.setImage(UIImage(named: "yesnoButton"), for: .normal)
      button.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.top.equalTo(self.coinStackView.snp.bottom).offset(20)
      }
    }
  }
  
  func layoutWatchAdLabel() {
    view.add(watchAdLabel) { label in
      label.text = "코인 채굴"
      label.font = .btnText(ofSize: 25)
      label.snp.makeConstraints { make in
        make.center.equalTo(self.watchAdButton)
      }
    }
  }
}

// MARK: - Actions
extension RewardAdViewController {
  
}
