//
//  MainDetailResponse.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/05.
//

import Foundation

// MARK: - MainDetailResponse
struct MainDetailResponse: Codable {
    let isMyFriend: Bool?
    let user: DetailUser
    let head: String?
}

// MARK: - User
struct DetailUser: Codable {
    let username, nickname: String
    let hairCount: Int
}
