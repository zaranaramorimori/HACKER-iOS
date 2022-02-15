//
//  UIButton+Extension.swift
//  HACKER
//
//  Created by 김지수 on 2022/01/25.
//

import Foundation
import UIKit

extension UIButton {
  func setInsets(
    forContentPadding contentPadding: UIEdgeInsets,
    imageTitlePadding: CGFloat
  ) {
    self.contentEdgeInsets = UIEdgeInsets(
      top: contentPadding.top,
      left: contentPadding.left,
      bottom: contentPadding.bottom,
      right: contentPadding.right + imageTitlePadding
    )
    self.titleEdgeInsets = UIEdgeInsets(
      top: 0,
      left: imageTitlePadding,
      bottom: 3,
      right: -imageTitlePadding
    )
  }
  func setupButton(title: String,
                   color: UIColor,
                   font: UIFont,
                   backgroundColor: UIColor,
                   state: UIControl.State,
                   radius: CGFloat) {
    self.setTitle(title, for: state)
    self.setTitleColor(color, for: state)
    self.titleLabel?.font = font
    self.backgroundColor = backgroundColor
    self.setRounded(radius: radius)
  }
  func addTextSpacing(_ letterSpacing: CGFloat){
    let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
    attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
    self.setAttributedTitle(attributedString, for: .normal)
  }
}
