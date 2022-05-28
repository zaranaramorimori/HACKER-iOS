//
//  LoginService.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/28.
//

import Foundation
import Moya

enum LoginService {
    case login(social: String)
}

extension LoginService: TargetType {

    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .login(let social):
            return "/auth/\(social)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login:
          return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .login:
          return Const.Header.basicHeader()
        }
    }
}
