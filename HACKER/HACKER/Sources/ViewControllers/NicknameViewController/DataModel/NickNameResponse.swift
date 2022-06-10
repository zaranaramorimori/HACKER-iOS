//
//  NickNameResponse.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/05.
//

// MARK: - NickNameResponse
struct NickNameResponse: Codable {
  let accessToken, refreshToken: String
  let username, nickname: String
  let id: Int
}
