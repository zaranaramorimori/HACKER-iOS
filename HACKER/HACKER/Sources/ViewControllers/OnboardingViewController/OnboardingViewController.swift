//
//  OnboardingViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/10/12.
//

import UIKit

import SnapKit
import Then

// MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {
  
  // MARK: - Components
  let onboardingCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.isPagingEnabled = true
    return collectionView
  }()
  let containerView = UIView()
  let skipButton = UIButton()
  let pageControl = UIPageControl()
  let nextButton = UIButton()
  
  var onboardingData: [OnboardingDataModel] = []
  
  var currentPage: Int = 0 {
    didSet {
      pageControl.currentPage = currentPage
      if currentPage == onboardingData.count-1 {
        nextButton.setupButton(title: "시작하기",
                               color: .hackerBlack,
                               font: .btnText(ofSize: 24),
                               backgroundColor: .clear,
                               state: .normal,
                               radius: 0)
        nextButton.setUnderline()
      } else {
        nextButton.setupButton(title: "다음으로",
                               color: .hackerBlack,
                               font: .btnText(ofSize: 24),
                               backgroundColor: .clear,
                               state: .normal,
                               radius: 0)
        nextButton.setUnderline()
      }
    }
  }
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    setUI()
    setCollectionView()
    setOnboardingData()
  }
}
// MARK: - Extension
extension OnboardingViewController {
  func layout() {
    layoutOnboardingCollectionView()
    layoutContainerView()
    layoutSkipButton()
    layoutPageControl()
    layoutNextButton()
  }
  func layoutOnboardingCollectionView() {
    self.view.add(onboardingCollectionView) {
      $0.showsHorizontalScrollIndicator = false
      $0.contentInsetAdjustmentBehavior = .never
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(57)
        make.leading.trailing.equalToSuperview()
        make.bottom.equalToSuperview().offset(-112)
      }
    }
  }
  func layoutContainerView() {
    self.view.add(containerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.leading.equalToSuperview().offset(26)
        make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-14)
        make.height.equalTo(24)
      }
    }
  }
  func layoutSkipButton() {
    self.containerView.add(skipButton) {
      $0.setupButton(title: "건너뛰기",
                     color: .hackerBlack,
                     font: .btnText(ofSize: 24),
                     backgroundColor: .clear,
                     state: .normal,
                     radius: 0)
      $0.setUnderline()
      $0.addTarget(self, action: #selector(self.skipButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.centerY.leading.equalToSuperview()
      }
    }
  }
  func layoutPageControl() {
    self.containerView.add(pageControl) {
      $0.numberOfPages = 5
      $0.pageIndicatorTintColor = .lightGray
      $0.currentPageIndicatorTintColor = .hackerBlack
      $0.snp.makeConstraints { make in
        make.centerX.centerY.equalToSuperview()
      }
    }
  }
  func layoutNextButton() {
    self.containerView.add(nextButton) {
      $0.setupButton(title: "다음으로",
                             color: .hackerBlack,
                             font: .btnText(ofSize: 24),
                             backgroundColor: .clear,
                             state: .normal,
                             radius: 0)
      $0.setUnderline()
      $0.addTarget(self, action: #selector(self.nextButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.centerY.trailing.equalToSuperview()
      }
    }
  }
  private func setUI() {
    pageControl.isUserInteractionEnabled = false
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
  }
  
  private func setCollectionView() {
    onboardingCollectionView.delegate = self
    onboardingCollectionView.dataSource = self
    self.onboardingCollectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
    onboardingCollectionView.contentInsetAdjustmentBehavior = .never
  }
  
  private func setOnboardingData() {
    onboardingData.append(contentsOf: [
      OnboardingDataModel(imageName: "onboarding_1"),
      OnboardingDataModel(imageName: "onboarding_2"),
      OnboardingDataModel(imageName: "onboarding_3"),
      OnboardingDataModel(imageName: "onboarding_4"),
      OnboardingDataModel(imageName: "onboarding_5")
    ])
  }
  @objc func skipButtonClicked() {
    let loginVC = LoginViewController()
    loginVC.modalPresentationStyle = .fullScreen
    loginVC.modalTransitionStyle = .crossDissolve
    self.present(loginVC, animated: true, completion: nil)
  }
  @objc func nextButtonClicked() {
    print("nextButtonClicked")
//    let loginVC = LoginViewController()
//    loginVC.modalPresentationStyle = .fullScreen
//    loginVC.modalTransitionStyle = .crossDissolve
//    self.present(loginVC, animated: true, completion: nil)
  }
}
// MARK: - CollectionView Delegate, DataSource
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return onboardingData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = onboardingCollectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.cellId, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
    cell.awakeFromNib()
    cell.setOnboardingSlides(onboardingData[indexPath.row])
    return cell
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let width = scrollView.frame.width
    currentPage = Int(scrollView.contentOffset.x / width)
  }
}

// MARK: - CollectionView Delegate Flow Layout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
}
