//
//  RetokenResponse.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/09/23.
//

import Foundation

struct RetokenResponse: Codable {
    let accessToken, refreshToken: String
}
