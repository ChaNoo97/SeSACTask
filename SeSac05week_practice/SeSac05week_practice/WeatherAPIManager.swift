//
//  WeatherAPIManager.swift
//  SeSac05week_practice
//
//  Created by Hoo's MacBookAir on 2021/10/27.
//

import Foundation
import SwiftyJSON
import Alamofire

class WeatherAPIManager {
	static let shard = WeatherAPIManager()
	
	func fetchWeatherData(lat: Double, long: Double, id: String, result: @escaping (JSON) -> () ) {
		let url = Endpoint.weatherURL + "weather?lat=\(lat)&lon=\(long)&appid=\(id)"
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
