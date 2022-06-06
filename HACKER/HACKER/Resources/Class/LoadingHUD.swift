//
//  LoadingHUD.swift
//  HACKER
//
//  Created by Danna Lee on 2022/06/06.
//

import Foundation
import UIKit

import Lottie

class LoadingHUD {
  public static let sharedInstance = LoadingHUD()
  
  private var backgroundView: UIView?
  
  class func show() {
    let backgroundView = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
    
    let lottieView = AnimationView()
    backgroundView.add(lottieView) {
      $0.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
      
      $0.animation = Animation.named("lf30_editor_kdpmpt6l")
      $0.contentMode = .scaleAspectFit
      $0.loopMode = .loop
      $0.play()
    }
    
    if let window = UIApplication.shared.keyWindow {
      window.addSubview(backgroundView)
      
      backgroundView.frame = CGRect(x: 0, y: 0, width: window.frame.maxX, height: window.frame.maxY)
      backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
      
      sharedInstance.backgroundView?.removeFromSuperview()
      sharedInstance.backgroundView = backgroundView
    }
  }
  
  class func hide() {
    if let backgroundView = sharedInstance.backgroundView {
      backgroundView.removeFromSuperview()
    }
  }
}
