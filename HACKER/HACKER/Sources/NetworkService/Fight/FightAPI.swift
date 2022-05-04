//
//  FightAPI.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/05.
//

import Foundation
import Moya

public class FightAPI {

    static let shared = FightAPI()
    var fightProvider = MoyaProvider<FightService>(plugins: [MoyaLoggerPlugin()])

    public init() { }

    func ingSeason(completion: @escaping (NetworkResult<Any>) -> Void) {
      fightProvider.request(.ingSeason) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeIngSeasonStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func judgeIngSeasonStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {

        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SeasonResponse>.self, from: data)
        else {
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
