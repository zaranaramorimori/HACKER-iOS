//
//  UIScreen_Extension.swift
//  HACKER
//
//  Created by Danna Lee on 2022/06/09.
//

import UIKit

extension UIScreen{
  public var hasNotch: Bool{
    let deviceRatio = UIScreen.main.bounds.width / UIScreen.main.bounds.height
    if deviceRatio > 0.5 {
      return false
    }
    else{
      return true
    }
  }
}
