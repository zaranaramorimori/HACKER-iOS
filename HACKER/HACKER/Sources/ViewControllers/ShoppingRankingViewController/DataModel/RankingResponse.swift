//
//  RankingResponse.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/14.
//

import Foundation

// MARK: - RankingResponse
struct RankingResponse: Codable {
  let myRank: Rank?
  let ranks: [Rank]
}

// MARK: - Rank
struct Rank: Codable {
  let userID, rank: Int
  let nickname: String
  let commitCount: Int
  let head: RankHead?

  enum CodingKeys: String, CodingKey {
      case userID = "userId"
      case rank, nickname, commitCount, head
  }
}
struct RankHead: Codable {
  let one, two, three, four: String?
  let five, six, seven, eight: String?
  let nine, ten, eleven, twelve: String?
}
