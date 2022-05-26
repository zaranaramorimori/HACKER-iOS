//
//  PushAPI.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/27.
//

import Foundation
import Moya

public class PushAPI {
  static let shared = PushAPI()
  var pushProvider = MoyaProvider<PushService>(plugins: [MoyaLoggerPlugin()])
  
  public init() { }
  
  func fetchPushList(completion: @escaping (NetworkResult<Any>) -> Void) {
    pushProvider.request(.fetchPushList) { (result) in
      switch result {
      case .success(let response):
        let statusCode = response.statusCode
        let data = response.data
        
        let networkResult = self.judgeFetchPushList(by: statusCode, data)
        completion(networkResult)
        
      case .failure(let err):
        print(err)
      }
    }
  }
  
  private func judgeFetchPushList(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(GenericResponse<PushResponse>.self, from: data) else {
      return .pathErr
    }
    
    switch statusCode {
    case 200:
      return .success(decodedData.data ?? "None-Data")
    case 400..<500:
      return .requestErr(decodedData.status)
    case 500:
      return .serverErr
    default:
      return .networkFail
    }
  }
}
