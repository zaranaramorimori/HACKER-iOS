//
//  Header.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/04/26.
//

import Foundation

extension Const {
  struct Header {
    static func applicationJsonHeader() -> [String: String] {
      ["Content-Type": "application/json"]
    }
    
    static func basicHeader() -> [String: String] {
      ["Content-Type": "application/json",
       "token": UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken) ?? ""]
    }
    
    static func tokenHeader() -> [String: String] {
      ["token": UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken) ?? ""]
    }
    
    static func urlEncodedHeader() -> [String: String] {
      ["Content-Type": "application/x-www-form-urlencoded"]
    }
    
    static func multipartFormHeader() -> [String: String] {
      ["Content-Type": "multipart/form-data",
       "token": UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken) ?? ""]
    }
  }
}
