//
//  Board.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/28.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let board = try? newJSONDecoder().decode(Board.self, from: jsonData)

import Foundation

// MARK: - BoardElement
struct BoardElement: Codable {
	let id: Int
	let text: String
	let usersPermissionsUser: UsersPermissionsUser
	let createdAt, updatedAt: String

	enum CodingKeys: String, CodingKey {
		case id, text
		case usersPermissionsUser = "users_permissions_user"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
}

// MARK: - UsersPermissionsUser
struct UsersPermissionsUser: Codable {
	let id: Int
	let username, email, provider: String
	let confirmed: Bool
	let role: Int
	let createdAt, updatedAt: String

	enum CodingKeys: String, CodingKey {
		case id, username, email, provider, confirmed, role
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
}

typealias Board = [BoardElement]

