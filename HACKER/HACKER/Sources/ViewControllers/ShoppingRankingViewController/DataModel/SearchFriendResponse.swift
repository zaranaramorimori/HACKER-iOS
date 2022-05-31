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
  let head: String?
}
