//
//  MainService.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/05.
//

import Foundation
import Moya

enum MainService {
  case userInfo
  case userDetailInfo
}

extension MainService: TargetType {

    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .userInfo :
          return "/user"
        case .userDetailInfo:
          return "/user/detail"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .userInfo :
          return .get
        case .userDetailInfo:
          return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .userInfo :
          return .requestPlain
        case .userDetailInfo:
          return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .userInfo :
          return Const.Header.basicHeader()
        case .userDetailInfo :
          return Const.Header.basicHeader()
        }
    }
}
