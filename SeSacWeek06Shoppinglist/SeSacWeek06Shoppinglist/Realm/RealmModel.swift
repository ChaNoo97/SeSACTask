//
//  RealmModel.swift
//  SeSacWeek06Shoppinglist
//
//  Created by Hoo's MacBookAir on 2021/11/02.
//

import Foundation
import RealmSwift

//테이블 이름
class UserShoppinglist: Object {
	@Persisted var content: String
	@Persisted var checkBtn: Bool
	@Persisted var bookmarkBtn: Bool
		//primaryKey 필수 String,Int,UUID,ObjectID
	@Persisted(primaryKey: true) var _id: ObjectId
	
	convenience init(content: String) {
		self.init()
		
		self.content = content
		self.checkBtn = false
		self.bookmarkBtn = false
		
	}
}
