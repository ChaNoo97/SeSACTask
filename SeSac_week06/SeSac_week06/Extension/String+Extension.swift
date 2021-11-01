//
//  String+Extension.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import Foundation

extension String {
	var localized: String {
		get { //연산 프로퍼티 get 생략 가능
			return NSLocalizedString(self, comment: "")
		}
	}
	
	func localized(tableName: String = "Localizable") -> String {
		return NSLocalizedString(self, tableName: tableName, bundle: .main, value: "", comment: "")
		
		//NSLocalizedString("data_backup", tableName: "Setting", bundle: .main, value: "", comment: "")
	}
}
