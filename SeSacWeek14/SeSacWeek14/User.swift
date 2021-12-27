//
//  User.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/27.
//

import Foundation

// MARK: - Login
struct User: Codable {
	let jwt: String
	let user: UserClass
}

// MARK: - User
struct UserClass: Codable {
	let id: Int
	let username, email: String
}

