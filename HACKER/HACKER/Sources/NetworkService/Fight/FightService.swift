//
//  FightService.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/05.
//

import Foundation
import Moya

enum FightService {
  case ingSeason
  case seasonTeamInfo(seasonId: Int)
}

extension FightService: TargetType {
  var baseURL: URL {
    return URL(string: Const.URL.baseURL)!
  }
  
  var path: String {
    switch self {
    case .ingSeason:
      return "/battle"
    case .seasonTeamInfo(let seasonId):
      return "/battle/season/\(seasonId)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .ingSeason, .seasonTeamInfo:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .ingSeason, .seasonTeamInfo:
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    switch self {
    case .ingSeason, .seasonTeamInfo:
      return Const.Header.basicHeader()
    }
  }
}
