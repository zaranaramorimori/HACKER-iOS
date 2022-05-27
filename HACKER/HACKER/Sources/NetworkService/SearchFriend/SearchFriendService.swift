//
//  SearchFriendService.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/14.
//

import Foundation
import Moya

enum SearchFriendService {
  case searchFriend
}

extension SearchFriendService: TargetType {

    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .searchFriend :
          return "/friend"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchFriend :
          return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .searchFriend :
          return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .searchFriend :
          return Const.Header.basicHeader()
        }
    }
}
