//
//  UserDefaultsKey.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/04/26.
//

import Foundation

extension Const {
  struct UserDefaultsKey {
    // 인증 토큰
    static let accessToken = "accessToken"
    static let refreshToken = "refreshToken"
    static let deviceToken = "deviceToken"
    
    // 사용자 정보
    static let username = "username" /// 사용자의 깃허브 유저네임
    static let nickname = "nickname" /// 사용자가 앱 내에서 사용하는 닉네임
    static let userID = "userID" /// 서버에서 부여되는 유저 ID (일련번호)
    
    // 애플 로그인
    static let isAppleLogin = "isAppleLogin" /// 애플 로그인으로 로그인 한 사용자인가?
    static let appleUserCredentialId = "appleUserCredentialId" /// 애플 로그인 시 부여되는 고유 user identifier
  }
}
