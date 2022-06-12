//
//  SettingAPI.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/26.
//

import Foundation
import Moya

public class SettingAPI {
  
  static let shared = SettingAPI()
  var settingProvider = MoyaProvider<SettingService>(plugins: [MoyaLoggerPlugin()])
  
  public init() { }
  
  func deleteAccount(completion: @escaping (NetworkResult<Any>) -> Void) {
    settingProvider.request(.deleteAccount) { (result) in
      switch result {
      case .success(let response):
        let statusCode = response.statusCode
        let data = response.data
        
        let networkResult = self.judgeStatus(by: statusCode, data)
        completion(networkResult)
        
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
  
  func changeNickname(nickname: String, completion: @escaping (NetworkResult<Any>) -> Void) {
    settingProvider.request(.changeNickname(nickname: nickname)) { (result) in
      switch result {
      case .success(let response):
        let statusCode = response.statusCode
        let data = response.data
        
        let networkResult = self.judgeChangeNicknameStatus(by: statusCode, data)
        completion(networkResult)
        
      case .failure(let err):
        print(err)
      }
    }
  }
  
  private func judgeChangeNicknameStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    
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
}
