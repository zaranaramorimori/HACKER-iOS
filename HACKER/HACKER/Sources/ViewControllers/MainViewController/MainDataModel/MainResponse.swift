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
    let head: String?
    let coupon: Coupon
}

// MARK: - Coupon
struct Coupon: Codable {
    let todayCommit, couponCommit, couponCount: Int
}

// MARK: - User
struct User: Codable {
    let nickname: String
}
