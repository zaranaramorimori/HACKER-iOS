//
//  SettingService.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/26.
//

import Foundation
import Moya

enum SettingService {
  case deleteAccount
  case changeNickname(nickname: String)
}

extension SettingService: TargetType {
  var baseURL: URL {
    return URL(string: Const.URL.baseURL)!
  }
  
  var path: String {
    switch self {
    case .deleteAccount:
      return "/user"
    case .changeNickname:
      return "/user/nickname"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .deleteAccount:
      return .delete
    case .changeNickname:
      return .put
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .deleteAccount:
      return .requestPlain
    case .changeNickname(let nickname):
      return .requestJSONEncodable(ChangeNicknameRequest(nickname: nickname))
    }
  }
  
  var headers: [String: String]? {
    switch self {
    case .deleteAccount:
      return Const.Header.tokenHeader()
    case .changeNickname:
      return Const.Header.basicHeader()
    }
  }
}
