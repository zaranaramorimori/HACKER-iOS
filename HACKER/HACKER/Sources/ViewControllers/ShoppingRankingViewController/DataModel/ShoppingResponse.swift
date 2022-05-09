//
//  FriendDetailResponse.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/10.
//

import Foundation

// MARK: - FriendDetailResponse
struct ShoppingResponse: Codable {
  let isMyFriend: Bool
  let user: ShoppingUser
  let head: ShoppingHead
}

// MARK: - Head
struct ShoppingHead: Codable {
  let one, two, three, four: String?
  let five, six, seven, eight: String?
  let nine, ten, eleven, twelve: String?
  let updatedAt: String?
}

// MARK: - User
struct ShoppingUser: Codable {
  let username, nickname: String
  let hairCount: Int
}
