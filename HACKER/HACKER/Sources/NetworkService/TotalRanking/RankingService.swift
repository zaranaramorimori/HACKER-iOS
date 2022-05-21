//
//  RankingService.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/14.
//

import Foundation
import Moya

enum RankingService {
  case totalRanking
}

extension RankingService: TargetType {

    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .totalRanking :
          return "/rank"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .totalRanking :
          return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .totalRanking :
          return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .totalRanking :
          return Const.Header.basicHeader()
        }
    }
}
