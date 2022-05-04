//
//  SeasonResponse.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/05.
//

import Foundation

// MARK: - SeasonResponse
struct SeasonResponse: Codable {
    let seasons: [Season]
}

// MARK: - Season
struct Season: Codable {
    let seasonID: Int
    let imageURL, agency, title, duration: String

    enum CodingKeys: String, CodingKey {
        case seasonID = "seasonId"
        case imageURL = "imageUrl"
        case agency, title, duration
    }
}
