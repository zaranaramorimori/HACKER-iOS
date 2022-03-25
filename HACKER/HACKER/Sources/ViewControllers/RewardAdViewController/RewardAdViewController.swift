//
//  RewardAdViewController.swift
//  HACKER
//
//  Created by Danna Lee on 2022/03/26.
//

import UIKit
import GoogleMobileAds

class RewardAdViewController: UIViewController {
  // MARK: - Properties
  var coinCount: Int = 10
  var rewardedAd: GADRewardedAd?
  
  // MARK: - Componenets
  private lazy var coinStackView: UIStackView = { createCoinStackView() }()
  private lazy var coinImageView: UIImageView = { createCoinImageView() }()
  private lazy var coinCountLabel: UILabel = { createLabel(text: "x\(coinCount)", size: 32, color: .hackerBlack) }()
  private lazy var watchAdButton: UIButton = { createWatchAdButton() }()
  private lazy var watchAdLabel: UILabel = { createLabel(text: "코인 채굴", size: 25, color: .hackerWhite) }()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadRewardedAd()
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
    button.addTarget(self, action: #selector(watchAdButtonTapped), for: .touchUpInside)
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

// MARK: - Functions
extension RewardAdViewController {
  func loadRewardedAd() -> GADRewardedAd? {
    
    let adUnitID = GoogleAds.sampleAdKey
    let request = GADRequest()
    
    GADRewardedAd.load(withAdUnitID: adUnitID, request: request) { [weak self] rewardedAd, error in
      if let error = error {
        print("Failed to load rewarded ad with error: \(error.localizedDescription)")
        return
      }
      self?.rewardedAd = rewardedAd
      self?.rewardedAd?.fullScreenContentDelegate = self as? GADFullScreenContentDelegate
//      self?.rewardedAd?.fullScreenContentDelegate = self
    }
    
    return rewardedAd
  }
}

// MARK: - Actions
extension RewardAdViewController {
  @objc private func watchAdButtonTapped() {
    rewardedAd?.present(fromRootViewController: self) { [weak self] in
      self?.coinCount += 5
      if let count = self?.coinCount {
        self?.coinCountLabel.text = "x\(count)"
      }
      self?.rewardedAd = self?.loadRewardedAd()
    }
  }
}

extension RewardAdViewController: GADMediationRewardedAdEventDelegate {
  func didRewardUser(with reward: GADAdReward) {
    print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    coinCount += 5
    coinCountLabel.text = "x\(coinCount)"
  }
  
  func didStartVideo() {
    print("Did start Video")
  }
  
  func didEndVideo() {
    print("Did end video")
  }
  
  func reportImpression() {
    print("report Impression")
  }
  
  func reportClick() {
    print("report click")
  }
  
  func willPresentFullScreenView() {
    print("Will present full screen view")
  }
  
  func didFailToPresentWithError(_ error: Error) {
    print("did fail to present with error")
  }
  
  func willDismissFullScreenView() {
    print("Will dismiss full screen view")
  }
  
  func didDismissFullScreenView() {
    print("did dismiss full screen view")
    rewardedAd = loadRewardedAd()
  }
}
