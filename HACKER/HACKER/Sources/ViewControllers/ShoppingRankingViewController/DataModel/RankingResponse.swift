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
  let head, face: String?

  enum CodingKeys: String, CodingKey {
      case userID = "userId"
      case rank, nickname, commitCount, head, face
  }
}
