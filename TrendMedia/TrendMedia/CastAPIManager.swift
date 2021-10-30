//
//  CastAPIManager.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/28.
//

import Foundation
import SwiftyJSON
import Alamofire

struct CastInfo {
	static let infoShared = CastInfo()
	
	func fetchCastData(movieid: Int, apikey: String, result: @escaping (JSON) -> () ) {
		
		let url = "https://api.themoviedb.org/3/movie/\(movieid)/credits?api_key=\(apikey)&language=en-US"
		
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
