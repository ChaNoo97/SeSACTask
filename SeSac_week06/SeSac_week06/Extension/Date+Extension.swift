//
//  Date+Extension.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/05.
//

import Foundation

extension DateFormatter {
	static var customFormat: DateFormatter {
		let date = DateFormatter()
		date.dateFormat = "yyyy년 MM월 dd일"
		return date
	}
}

