//
//  AttackAPI.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/26.
//

import Foundation
import Moya

public class AttackAPI {
  
  static let shared = AttackAPI()
  var friendProvider = MoyaProvider<AttackService>(plugins: [MoyaLoggerPlugin()])
  
  public init() { }
  
  func attackUser(userId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
    friendProvider.request(.attackUser(userId: userId)) { (result) in
      switch result {
      case .success(let response):
        let statusCode = response.statusCode
        let data = response.data
        
        let networkResult = self.judgeAttackUserStatus(by: statusCode, data)
        completion(networkResult)
        
      case .failure(let err):
        print(err)
      }
    }
  }
  
  private func judgeAttackUserStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(GenericResponse<[FriendGithubResponse]>.self, from: data) else {
      return .pathErr
    }
    
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
}
