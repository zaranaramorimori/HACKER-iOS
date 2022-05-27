//
//  TeamDetailResponse.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/05.
//

import Foundation

// MARK: - TeamDetailResponse
struct TeamDetailResponse: Codable {
    let isMyTeam: Bool
    let team: TeamInfo
    let members: [Member]
    let logs: [Log]
}

// MARK: - Log
struct Log: Codable {
  let date: String
  let content: [String]
}

// MARK: - Member
struct Member: Codable {
    let userID: Int
    let nickname: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case nickname
    }
}

// MARK: - TeamInfo
struct TeamInfo: Codable {
    let name, imageURL: String
    let commitCount, hairCount, couponCount: Int

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "imageUrl"
        case commitCount, hairCount, couponCount
    }
}
