//
//  SignUpAPI.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/05.
//

import Foundation
import Moya

public class SignUpAPI {

    static let shared = SignUpAPI()
    var signUpProvider = MoyaProvider<SignUpService>(plugins: [MoyaLoggerPlugin()])

    public init() { }

  func userGithubName(username: String, completion: @escaping (NetworkResult<Any>) -> Void) {
    signUpProvider.request(.userGithubName(username: username)) { (result) in
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
        guard let decodedData = try? decoder.decode(GenericResponse<SignUpResponse>.self, from: data)
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
