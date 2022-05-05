//
//  MainAPI.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/05.
//

import Foundation
import Moya

public class MainAPI {
  
  static let shared = MainAPI()
  var mainProvider = MoyaProvider<MainService>()
  
  public init() { }
  
  func userInfo(completion: @escaping(NetworkResult<Any>) -> Void) {
    mainProvider.request(.userInfo) { (result) in
      switch result {
      case .success(let response):
          let statusCode = response.statusCode
          let data = response.data
          let networkResult = self.judgeUserInfoStatus(by: statusCode, data)
          completion(networkResult)
          
      case .failure(let err):
          print(err)
      }
    }
  }
  func userDetailInfo(completion: @escaping(NetworkResult<Any>) -> Void) {
    mainProvider.request(.userDetailInfo) { (result) in
      switch result {
      case .success(let response):
          let statusCode = response.statusCode
          let data = response.data
          let networkResult = self.judgeUserDetailInfoStatus(by: statusCode, data)
          completion(networkResult)
          
      case .failure(let err):
          print(err)
      }
    }
  }
  private func judgeUserInfoStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {

      let decoder = JSONDecoder()
      guard let decodedData = try? decoder.decode(GenericResponse<MainResponse>.self, from: data)
      else {
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
  private func judgeUserDetailInfoStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {

      let decoder = JSONDecoder()
      guard let decodedData = try? decoder.decode(GenericResponse<MainDetailResponse>.self, from: data)
      else {
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
