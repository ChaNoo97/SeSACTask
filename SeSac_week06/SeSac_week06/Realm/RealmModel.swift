//
//  RealmModel.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/02.
//

import Foundation
import RealmSwift

class Diary: Object {
	@Persisted var diaryTitle: String
	@Persisted var diaryContent: String?
	@Persisted var writeDate = Date()
	@Persisted var regDate = Date()
	@Persisted var favorite: Bool

	@Persisted(primaryKey: true) var _id: ObjectId


	convenience init(diaryTitle: String, diaryContent: String?, writeDate: Date, regDate: Date) {
		self.init()
		
		
		self.diaryTitle = diaryTitle
		self.diaryContent = diaryContent
		self.writeDate = writeDate
		self.regDate = regDate
		self.favorite = false
	
	}
}
