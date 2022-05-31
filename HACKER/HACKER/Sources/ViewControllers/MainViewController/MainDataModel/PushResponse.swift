//
//  PushResponse.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/27.
//

import Foundation

struct PushResponse: Codable {
  let logs: [PushLog]?
}

struct PushLog: Codable {
    let date: String
    let content: [String]
}
