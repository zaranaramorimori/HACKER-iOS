//
//  LoginResponse.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/28.
//

import Foundation
 
struct LoginResponse: Codable {
  var type: String
  var accessToken: String
  var refreshToken: String
  let username, nickname: String
  let id: Int
}
