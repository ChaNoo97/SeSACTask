//
//  RealmModel.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/11/04.
//

import Foundation
import RealmSwift

class BoxofficeData: Object {
	@Persisted var title: String
	@Persisted var openDt: String
	@Persisted var uploadDate: String
		//primaryKey 필수 String,Int,UUID,ObjectID
	@Persisted(primaryKey: true) var _id: ObjectId
	
	convenience init(title: String, openDt: String, uploadDate: String) {
		self.init()
		
		self.title = title
		self.uploadDate = uploadDate
		self.openDt = openDt
	}
}
