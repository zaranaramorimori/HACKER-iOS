//
//  FriendResponse.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/14.
//

import Foundation

struct FriendGithubResponse: Codable {
    let id: Int
    let username, nickname, profileImage: String
    let isFriend: Bool
}
