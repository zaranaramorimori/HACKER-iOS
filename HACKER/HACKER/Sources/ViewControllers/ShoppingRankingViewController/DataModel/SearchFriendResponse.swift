//
//  SearchFriendResponse.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/14.
//

import Foundation

// MARK: - SearchFriendResponse
struct SearchFriendResponse: Codable {
  let id: Int
  let nickname: String
  let head: SearchHead
}

// MARK: - Head
struct SearchHead: Codable {
  let one, two, three, four: String?
  let five, six, seven, eight: String?
  let nine, ten, eleven, twelve: String?
}
