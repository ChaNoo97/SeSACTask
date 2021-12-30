//
//  BeerData.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/26.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let board = try? newJSONDecoder().decode(Board.self, from: jsonData)

import Foundation

// MARK: - BoardElement
struct BoardElement: Codable {
	let id: Int
	let name, tagline, boardDescription: String
	let imageURL: JSONNull?
	let foodPairing: [String]
	let brewersTips: String

	enum CodingKeys: String, CodingKey {
		case id, name, tagline
		case boardDescription = "description"
		case imageURL = "image_url"
		case foodPairing = "food_pairing"
		case brewersTips = "brewers_tips"
	}
}

typealias Board = [BoardElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

	public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
		return true
	}

	public var hashValue: Int {
		return 0
	}

	public init() {}

	public required init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if !container.decodeNil() {
			throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encodeNil()
	}
}
