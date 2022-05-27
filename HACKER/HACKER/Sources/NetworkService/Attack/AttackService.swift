//
//  AttackService.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/26.
//

import Foundation
import Moya

enum AttackService {
  case attackUser(userId: Int)
  case attackTeam(teamId: Int)
  case getAttackCoupon
}

extension AttackService: TargetType {
  var baseURL: URL {
    return URL(string: Const.URL.baseURL + "/attack")!
  }
  
  var path: String {
    switch self {
    case .attackUser(let userId):
      return "/user/\(userId)"
    case .attackTeam(teamId: let teamId):
      return "/team/\(teamId)"
    case .getAttackCoupon:
      return "/coupon"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .attackUser:
      return .post
    case .attackTeam:
      return    .post
    case .getAttackCoupon:
      return .post
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .attackUser:
      return .requestPlain
    case .attackTeam:
      return .requestPlain
    case .getAttackCoupon:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .attackUser:
      return Const.Header.basicHeader()
    case .attackTeam:
      return Const.Header.basicHeader()
    case .getAttackCoupon:
      return Const.Header.basicHeader()
    }
  }
}
