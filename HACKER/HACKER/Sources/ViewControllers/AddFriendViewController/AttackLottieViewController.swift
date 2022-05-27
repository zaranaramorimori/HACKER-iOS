//
//  AttackLottieViewController.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/26.
//

import UIKit
import Lottie

class AttackLottieViewController: UIViewController {
  
  let lottieView = AnimationView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setStyle()
    setupLottie()
  }
  
}

extension AttackLottieViewController {
  private func setStyle() {
    view.backgroundColor = .hackerBackgroundBlack
  }
  
  private func setupLottie() {
    view.add(lottieView) {
      $0.snp.makeConstraints { make in
        make.edges.equalToSuperview().inset(50)
      }
      $0.animation = Animation.named("pullingOut")
      $0.contentMode = .scaleAspectFit
      $0.loopMode = .playOnce
      $0.play { _ in
        self.dismiss(animated: false)
      }
    }
  }
}
