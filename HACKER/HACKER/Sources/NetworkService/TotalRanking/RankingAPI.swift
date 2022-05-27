//
//  RankingAPI.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/14.
//

import Foundation
import Moya

public class RankingAPI {
  
  static let shared = RankingAPI()
  var rankingProvider = MoyaProvider<RankingService>()
  
  public init() { }
  
  func totalRanking(completion: @escaping(NetworkResult<Any>) -> Void) {
    rankingProvider.request(.totalRanking) { (result) in
      switch result {
      case .success(let response):
          let statusCode = response.statusCode
          let data = response.data
          let networkResult = self.judgeRankingStatus(by: statusCode, data)
          completion(networkResult)
          
      case .failure(let err):
          print(err)
      }
    }
  }
  private func judgeRankingStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(GenericResponse<RankingResponse>.self, from: data)
    else { return .pathErr }
    
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
}
