//
//  UIFont+Extension.swift
//  HACKER
//
//  Created by 김지수 on 2022/01/25.
//

import Foundation
import UIKit

extension UIFont {

  class func titleBold(ofSize: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansKR-Bold", size: ofSize)!
  }
  
  class func subtitleMedium(ofSize: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansKR-Medium", size: ofSize)!
  }
  
  class func subtitleRegular(ofSize: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansKR-Regular", size: ofSize)!
  }
  
  class func bodyRegular(ofSize: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansKR-Regular", size: ofSize)!
  }
  
  class func btnText(ofSize: CGFloat) -> UIFont {
      return UIFont(name: "KCC-Kimhwanki", size: ofSize)!
  }
}
