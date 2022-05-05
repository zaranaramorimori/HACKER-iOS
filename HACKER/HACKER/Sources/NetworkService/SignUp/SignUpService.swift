//
//  SignUpService.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/05.
//

import Foundation
import Moya

enum SignUpService {
  case userGithubName(username: String)
}

extension SignUpService: TargetType {
  var baseURL: URL {
    return URL(string: Const.URL.baseURL)!
  }
  
  var path: String {
    switch self {
    case .userGithubName(let username):
      return "/auth/github/\(username)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .userGithubName:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .userGithubName:
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    switch self {
    case .userGithubName:
      return Const.Header.basicHeader()
    }
  }
}

