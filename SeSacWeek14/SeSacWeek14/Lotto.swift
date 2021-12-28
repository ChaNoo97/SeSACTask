//
//  Lotto.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/28.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let lotto = try? newJSONDecoder().decode(Lotto.self, from: jsonData)

import Foundation

// MARK: - Lotto
struct Lotto: Codable {
	let totSellamnt: Int
	let returnValue, drwNoDate: String
	let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
	let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
	let drwtNo2, drwtNo3, drwtNo1: Int
}
