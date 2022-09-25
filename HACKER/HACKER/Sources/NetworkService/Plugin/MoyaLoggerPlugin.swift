//
//  MoyaLoggerPlugin.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/05.
//

import Foundation
import Moya

final class MoyaLoggerPlugin: PluginType {
  
  // Request를 보낼 때 호출
  func willSend(_ request: RequestType, target: TargetType) {
    guard let httpRequest = request.request else {
      print("--> 유효하지 않은 요청")
      return
    }
    let url = httpRequest.description
    let method = httpRequest.httpMethod ?? "unknown method"
    var log = "----------------------------------------------------\n[\(method)] \(url)\n----------------------------------------------------\n"
    log.append("API: \(target)\n")
    if let headers = httpRequest.allHTTPHeaderFields, !headers.isEmpty {
      log.append("header: \(headers)\n")
    }
    if let body = httpRequest.httpBody, let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
      log.append("\(bodyString)\n")
    }
    log.append("------------------- END \(method) --------------------------")
    print(log)
  }
  
  // Response가 왔을 때
  func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
    switch result {
    case let .success(response):
      onSuceed(response, target: target, isFromError: false)
    case let .failure(error):
      onFail(error, target: target)
    }
  }
  
  func onSuceed(_ response: Response, target: TargetType, isFromError: Bool) {
    let request = response.request
    let url = request?.url?.absoluteString ?? "nil"
    let statusCode = response.statusCode
    var log = "------------------- 네트워크 통신 성공(isFromError: \(isFromError)) -------------------"
    log.append("\n[\(statusCode)] \(url)\n----------------------------------------------------\n")
    log.append("API: \(target)\n")
    response.response?.allHeaderFields.forEach {
      log.append("\($0): \($1)\n")
    }
    if let reString = String(bytes: response.data, encoding: String.Encoding.utf8) {
      log.append("\(reString)\n")
    }
    //TODO: 401일때 리프레시
    if statusCode == 401 {
      LoginAPI.shared.retoken() { response in
        switch response {
        case .success(let data):
          if let retokenInfo = data as? GenericResponse<RetokenResponse> {
            if retokenInfo.status == 401 {
              // TODO: 로그아웃
              UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.accessToken)
              UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.refreshToken)
              self.pushToLoginView()
            } else {
              // TODO: 401이면 액세스토큰 만료되어 토큰 재발급
              guard let retokenData = retokenInfo.data else { return }
              print("액세스토큰 만료로 토큰 재발급")
              UserDefaults.standard.set(retokenData.accessToken, forKey: Const.UserDefaultsKey.accessToken)
              guard let key =  UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken) else { return }
              print("accesstoken:\(key)")
            }
          }
        case .requestErr(let message):
          print("retoken - requestErr: \(message)")
        case .pathErr:
          print("retoken - pathErr")
        case .serverErr:
          print("retoken - serverErr")
        case .networkFail:
          print("retoken - networkFail")
        default:
          print("retoken")
        }
      }
    }
    log.append("------------------- END HTTP -------------------")
    print(log)
  }
  
  func onFail(_ error: MoyaError, target: TargetType) {
    if let response = error.response {
      onSuceed(response, target: target, isFromError: true)
      return
    }
    var log = "네트워크 오류"
    log.append("<-- \(error.errorCode) \(target)\n")
    log.append("\(error.failureReason ?? error.errorDescription ?? "unknown error")\n")
    log.append("<-- END HTTP")
    print(log)
  }
  
  // MARK: - Custom Method
  
  func pushToLoginView() {
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    let sceneDelegate = windowScene?.delegate as? SceneDelegate
    let viewController = LoginViewController()
    sceneDelegate?.window?.rootViewController = viewController
    sceneDelegate?.window?.makeKeyAndVisible()
  }
}
