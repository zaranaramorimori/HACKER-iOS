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
}

extension SettingService: TargetType {
  var baseURL: URL {
    return URL(string: Const.URL.baseURL)!
  }
  
  var path: String {
    switch self {
    case .deleteAccount:
      return "/user"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .deleteAccount:
      return .delete
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .deleteAccount:
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    switch self {
    case .deleteAccount:
      return Const.Header.tokenHeader()
    }
  }
}

