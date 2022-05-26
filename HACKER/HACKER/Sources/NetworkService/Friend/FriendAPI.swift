//
//  FriendAPI.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/11.
//

import Foundation
import Moya


public class FriendAPI {
  
  static let shared = FriendAPI()
  var friendProvider = MoyaProvider<FriendService>(plugins: [MoyaLoggerPlugin()])
  
  public init() { }
  
  func searchFriendGithub(username: String, completion: @escaping (NetworkResult<Any>) -> Void) {
    friendProvider.request(.searchFriendGithub(username: username)) { (result) in
      switch result {
      case .success(let response):
        let statusCode = response.statusCode
        let data = response.data
        
        let networkResult = self.judgeGithubStatus(by: statusCode, data)
        completion(networkResult)
        
      case .failure(let err):
        print(err)
      }
    }
  }
  
  private func judgeGithubStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(GenericResponse<[FriendGithubResponse]>.self, from: data) else {
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
  
  func addFriend(requestBody: AddFriendRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
    friendProvider.request(.addFriend(requestBody: requestBody)) { (result) in
      switch result {
      case .success(let response):
        let statusCode = response.statusCode
        let data = response.data
        
        let networkResult = self.judgeAddFriendStatus(by: statusCode, data)
        completion(networkResult)
        
      case .failure(let err):
        print(err)
      }
    }
  }
  
  private func judgeAddFriendStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(GenericResponse<AddFriendResponse>.self, from: data) else {
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
