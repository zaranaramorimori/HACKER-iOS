//
//  NickNameService.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/05.
//

import Foundation
import Moya

enum NickNameService {
  case userNickname(nicknameRequest: NickNameRequest)
}

extension NickNameService: TargetType {
  var baseURL: URL {
    return URL(string: Const.URL.baseURL)!
  }
  
  var path: String {
    switch self {
    case .userNickname:
      return "/auth"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .userNickname:
      return .post
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .userNickname(let nicknameRequest):
      return .requestJSONEncodable(nicknameRequest)
      

    }
  }
  
  var headers: [String: String]? {
    switch self {
    case .userNickname:
      return Const.Header.basicHeader()
    }
  }
}

