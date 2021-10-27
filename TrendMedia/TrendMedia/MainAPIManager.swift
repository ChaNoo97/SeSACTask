//
//  MainAPIManager.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/27.
//

import Foundation
import SwiftyJSON
import Alamofire

struct TMDBManager {
	static let shared = TMDBManager()
	
	func fetchTrendData(apikey: String, result: @escaping (JSON) -> ()) {
		
		let url = Endpoint.TMDBURL + apikey
		
		AF.request(url, method: .get).validate().responseJSON { response in
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				print("JSON: \(json)")
				result(json)
			case .failure(let error):
				print(error)
			}
		}
	}
}

