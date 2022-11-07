//
//  OnboardingCollectionViewCell.swift
//  HACKER
//
//  Created by 김지수 on 2022/10/12.
//

import UIKit

import SnapKit
import Then

// MARK: - OnboardingCollectionViewCell
class OnboardingCollectionViewCell: UICollectionViewCell {
  static let cellId = String(describing: OnboardingCollectionViewCell.self)
  
  let imageName: String = ""
  let onboardingImageView = UIImageView()
  
  // MARK: - Life Cycles
  override func awakeFromNib() {
    super.awakeFromNib()
    contentView.backgroundColor = .hackerWhite
    layout()
  }
  // MARK: - Custom Functions
  func setOnboardingSlides(_ slides: OnboardingDataModel) {
    setOnboardingImage(slides.imageName)
  }
  private func setOnboardingImage(_ onboardingImageName: String) {
    onboardingImageView.contentMode = .scaleAspectFit
    onboardingImageView.image = UIImage(named: onboardingImageName)
  }
}
extension OnboardingCollectionViewCell {
  func layout() {
    layoutOnboardingImageView()
  }
  func layoutOnboardingImageView() {
    self.contentView.add(onboardingImageView) {
      $0.image = UIImage(named: "onboarding_1")
      $0.snp.makeConstraints { make in
        make.top.bottom.equalToSuperview()
        make.centerX.equalToSuperview()
      }
    }
  }
}
