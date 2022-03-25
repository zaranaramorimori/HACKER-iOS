//
//  RewardAdViewController.swift
//  HACKER
//
//  Created by Danna Lee on 2022/03/26.
//

import UIKit

class RewardAdViewController: UIViewController {
  // MARK: - Properties
  var coinCount: Int = 10
  
  // MARK: - Componenets
  private lazy var coinStackView: UIStackView = { createCoinStackView() }()
  private lazy var coinImageView: UIImageView = { createCoinImageView() }()
  private lazy var coinCountLabel: UILabel = { createLabel(text: "x\(coinCount)", size: 32, color: .hackerBlack) }()
  private lazy var watchAdButton: UIButton = { createWatchAdButton() }()
  private lazy var watchAdLabel: UILabel = { createLabel(text: "코인 채굴", size: 25, color: .hackerWhite) }()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setBackground()
    setView()
    setLayout()
  }
}

// MARK: - UI
extension RewardAdViewController {
  private func setBackground() {
    view.backgroundColor = .white
    navigationController?.navigationBar.isHidden = true
  }
  
  private func setView() {
    view.addSubviews([coinStackView, watchAdButton, watchAdLabel])
    coinStackView.addArrangedSubview(coinImageView)
    coinStackView.addArrangedSubview(coinCountLabel)
  }
  
  private func setLayout() {
    layoutCoinStackView()
    layoutAdButton()
  }
  
  private func createCoinStackView() -> UIStackView {
    let stack = UIStackView()
    stack.alignment = .center
    stack.spacing = 7
    return stack
  }
  
  private func createCoinImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "logoIcon")
    imageView.contentMode = .scaleAspectFit
    return imageView
  }
  
  private func createLabel(text: String, size: CGFloat, color: UIColor) -> UILabel {
    let label = UILabel()
    label.setupLabel(text: text, color: color, font: .btnText(ofSize: size))
    return label
  }
  
  private func createWatchAdButton() -> UIButton {
    let button = UIButton()
    button.setImage(UIImage(named: "yesnoButton"), for: .normal)
    return button
  }
  
  private func createWatchAdLabel() -> UILabel {
    view.add(watchAdLabel) { label in
      label.text = "코인 채굴"
      label.font = .btnText(ofSize: 25)
      
    }
  }
  
  private func layoutCoinStackView() {
    coinStackView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
      make.height.equalTo(35)
    }
    
    coinImageView.snp.makeConstraints { make in
      make.width.equalTo(35)
    }
  }
  
  private func layoutAdButton() {
    watchAdButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(coinStackView.snp.bottom).offset(20)
    }
    
    watchAdLabel.snp.makeConstraints { make in
      make.center.equalTo(watchAdButton)
    }
  }
}

// MARK: - Actions
extension RewardAdViewController {
  @objc private func watchAdButtonTapped() {
    
  }
}
