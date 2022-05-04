//
//  SeasonTeamResponse.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/05.
//

import Foundation

// MARK: - SeasonTeamResponse
struct SeasonTeamResponse: Codable {
    let myTeam: Team?
    let teams: [Team]
}

// MARK: - Team
struct Team: Codable {
    let teamID, rank: Int
    let name: String
    let commitCount: Int
    let hairCount: Int?

    enum CodingKeys: String, CodingKey {
        case teamID = "teamId"
        case rank, name, commitCount, hairCount
    }
}
