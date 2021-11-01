//
//  LocalizableStrings.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import Foundation

// 1. 열거형, 케이스, 멤버와 값의 분리
// 2. 연산 프로퍼티
// 3. 익스텐션

enum LocalizableStrings: String {
	case welcome_text
	case data_backup
	case data_restore
	
	
	var localized: String {
		return self.rawValue.localized() // "welcome_text"
	}
	
	var localizedSetting: String {
		return self.rawValue.localized(tableName: "Setting") //Setting.string
	}
}
