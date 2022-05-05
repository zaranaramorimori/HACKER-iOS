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
}

extension MainService: TargetType {

    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .userInfo :
          return "/user"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .userInfo :
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
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .userInfo :
          return Const.Header.basicHeader()
        }
    }
}
