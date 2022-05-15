//
//  FriendService.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/14.
//

import Foundation
import Moya

enum FriendService {
  case searchFriendGithub(username: String)
}

extension FriendService: TargetType {
  var baseURL: URL {
    return URL(string: Const.URL.baseURL)!
  }
  
  var path: String {
    switch self {
    case .searchFriendGithub(let username):
      return "/friend/github/\(username)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .searchFriendGithub:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .searchFriendGithub:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .searchFriendGithub:
      return Const.Header.basicHeader()
    }
  }
  
}
