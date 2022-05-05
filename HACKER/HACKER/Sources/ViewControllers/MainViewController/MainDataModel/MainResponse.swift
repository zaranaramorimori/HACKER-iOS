//
//  MainResponse.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/05.
//

import Foundation

// MARK: - MainResponse
struct MainResponse: Codable {
    let user: User
    let head: Head
    let coupon: Coupon
}

// MARK: - Coupon
struct Coupon: Codable {
    let todayCommit, couponCommit, couponCount: Int
}

// MARK: - Head
struct Head: Codable {
    let one, two, three, four: String?
    let five, six, seven, eight: String?
    let nine, ten, eleven, twelve: String?
}

// MARK: - User
struct User: Codable {
    let nickname: String
}
