//
//  LoginAPI.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/28.
//

import Foundation
import Moya

public class LoginAPI {
  
  static let shared = LoginAPI()
  var loginProvider = MoyaProvider<LoginService>(plugins: [MoyaLoggerPlugin()])
  
  public init() { }
  
  func login(social: String, completion: @escaping (NetworkResult<Any>) -> Void) {
    loginProvider.request(.login(social: social)) { (result) in
      switch result {
      case .success(let response):
        let statusCode = response.statusCode
        print(statusCode)
        let data = response.data
        //로그인, 회원가입 구분
        switch statusCode {
        case 201:
          let networkResult = self.judgeLoginNewStatus(by: statusCode, data)
          completion(networkResult)
          
        default:
          let networkResult = self.judgeLoginStatus(by: statusCode, data)
          completion(networkResult)
        }
        
      case .failure(let err):
        print(err)
      }
    }
  }
  
  private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(GenericResponse<String>.self, from: data)
    else { return .pathErr }
    
    switch statusCode {
    case 200:
      return .success(decodedData.message)
    case 400..<500:
      return .requestErr(decodedData.message)
    case 500:
      return .serverErr
    default:
      return .networkFail
    }
  }
  
  private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(GenericResponse<LoginResponse>.self, from: data)
    else { return .pathErr }
    
    switch statusCode {
    case 200:
      return .success(decodedData.data ?? "None-Data")
    case 400..<500:
      return .requestErr(decodedData.message)
    case 500:
      return .serverErr
    default:
      return .networkFail
    }
  }
  private func judgeLoginNewStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(GenericResponse<LoginNewResponse>.self, from: data)
    else { return .pathErr }
    
    switch statusCode {
    case 201:
      return .success(decodedData.data ?? "None-Data")
    case 400..<500:
      return .requestErr(decodedData.message)
    case 500:
      return .serverErr
    default:
      return .networkFail
    }
  }
}
