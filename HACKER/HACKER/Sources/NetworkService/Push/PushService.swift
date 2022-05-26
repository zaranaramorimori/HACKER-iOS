//
//  PushService.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/27.
//

import Foundation
import Moya

enum PushService {
  case fetchPushList
}

extension PushService: TargetType {
  var baseURL: URL {
    return URL(string: Const.URL.baseURL + "/push")!
  }
  
  var path: String {
    switch self {
    case .fetchPushList:
      return "/"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .fetchPushList:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .fetchPushList:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .fetchPushList:
      return Const.Header.basicHeader()
    }
  }
  
}
