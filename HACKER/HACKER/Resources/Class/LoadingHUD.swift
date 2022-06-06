//
//  LoadingHUD.swift
//  HACKER
//
//  Created by Danna Lee on 2022/06/06.
//

import Foundation
import UIKit

import Lottie

protocol LoadingDelegate {
  func btnClose()
}

class LoadingHUD {
  public static let sharedInstance = LoadingHUD()
  
  private var backgroundView: UIView?
  private var popupView: AnimationView?
  private var loadingLabel: UILabel?
  public var btnLoadingClose: UIButton?
  public var delegate: LoadingDelegate?
  
  
  class func show() {
    let backgroundView = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
    
    let lottieView = AnimationView()
    backgroundView.add(lottieView) {
      $0.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
      
      $0.animation = Animation.named("lf30_editor_kdpmpt6l")
      
      $0.contentMode = .scaleAspectFit
      $0.loopMode = .playOnce
      $0.play()
    }
    
    if let window = UIApplication.shared.keyWindow {
      window.addSubview(backgroundView)
//      window.addSubview(popupView)
//      window.addSubview(loadingLabel)
//      window.addSubview(btnClose)
//
      backgroundView.frame = CGRect(x: 0, y: 0, width: window.frame.maxX, height: window.frame.maxY)
      backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
      
//      popupView.center = window.center
//      popupView.startAnimating()
      
//      loadingLabel.layer.position = CGPoint(x: window.frame.midX, y: popupView.frame.maxY + 5)
      
//      btnClose.frame = CGRect(x: 0, y: 0, width: window.frame.maxX, height: 60)
//      btnClose.layer.position = CGPoint(x: window.frame.midX, y: window.frame.maxY-30)
      
      sharedInstance.backgroundView?.removeFromSuperview()
      sharedInstance.popupView?.removeFromSuperview()
      sharedInstance.loadingLabel?.removeFromSuperview()
      sharedInstance.backgroundView = backgroundView
      sharedInstance.popupView = lottieView
//      sharedInstance.loadingLabel = loadingLabel
//      sharedInstance.btnLoadingClose = btnClose
    }
  }
  
  class func hide() {
    if let popupView = sharedInstance.popupView,
       let loadingLabel = sharedInstance.loadingLabel,
       let btnLoadingClose = sharedInstance.btnLoadingClose,
       let backgroundView = sharedInstance.backgroundView {
//      popupView.stopAnimating()
      backgroundView.removeFromSuperview()
      popupView.removeFromSuperview()
      loadingLabel.removeFromSuperview()
      btnLoadingClose.removeFromSuperview()
    }
  }
  
//  class func isAnimation() -> Bool {
//    return sharedInstance.popupView?.isAnimating ?? false
//  }
  
  class func setHidden() {
    sharedInstance.backgroundView?.isHidden = true
    sharedInstance.popupView?.isHidden = true
    sharedInstance.loadingLabel?.isHidden = true
  }
  
  @objc class func btnCloseLoding () {
    if sharedInstance.delegate != nil {
      sharedInstance.delegate?.btnClose()
    }
  }
  
  private class func getAnimationImageArray() -> [UIImage] {
    var animationArray: [UIImage] = []
    animationArray.append(UIImage(named: "HomeWolleyNormal")!)
    return animationArray
  }
}
