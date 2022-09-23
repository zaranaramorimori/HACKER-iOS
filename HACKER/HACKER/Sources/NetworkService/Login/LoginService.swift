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
    case retoken
}

extension LoginService: TargetType {

    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .login(let social):
            return "/auth/\(social)"
        case .retoken:
            return "/auth/token"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .get
        case .retoken:
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
        case .retoken:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .login:
            return Const.Header.socialHeader()
        case .retoken:
            return Const.Header.retokenHeader()
        }
    }
}
