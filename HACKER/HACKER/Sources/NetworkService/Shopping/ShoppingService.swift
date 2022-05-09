//
//  ShoppingService.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/10.
//

import Foundation
import Moya

enum ShoppingService {
  case friendDetail(userID: Int)
}

extension ShoppingService: TargetType {
  var baseURL: URL {
    return URL(string: Const.URL.baseURL)!
  }
  
  var path: String {
    switch self {
    case .friendDetail(let userID):
      return "/user/detail/\(userID)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .friendDetail:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .friendDetail:
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    switch self {
    case .friendDetail:
      return Const.Header.basicHeader()
    }
  }
}

