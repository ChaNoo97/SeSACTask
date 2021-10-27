//
//  ViewController.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/25.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

	@IBOutlet weak var tempLabel: UILabel!
	@IBOutlet weak var windLabel: UILabel!
	
	@IBOutlet weak var humainityLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getCurrentWeather()
		
	}
	
	func getCurrentWeather() {
		
		// https:// 까먹지 말자
		let url = "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=eee90f108f2fc83f5e8de93edeb85d64"
		//API 공식문서 에서 단위 지정 가능
		
		AF.request(url, method: .get).validate().responseJSON { response in
			switch response.result {
			case .success(let value):
				
				let json = JSON(value)
				print("JSON: \(json)")
				
				// 옵셔널이 아니면 doubleValue   main, temp, 의 값은 켈빈온도(-273.15 로 처리)
				let currentTemp = json["main"]["temp"].doubleValue - 273.15
				print(currentTemp)
				self.tempLabel.text = "\(Int(currentTemp)) ºC"
				
				let currentWindGust = json["wind"]["gust"].doubleValue
				let currentWindDeg = json["wind"]["deg"].intValue
				let currentWindSpeed = json["wind"]["speed"].doubleValue
				self.windLabel.text = "\(Int(currentWindGust)) 풍향은 \(currentWindDeg) 풍속은 \(Int(currentWindSpeed))`"
				let currentHumidity = json["main"]["humidity"].intValue
				self.humainityLabel.text = "현재습도 \(currentHumidity)"
				
			case .failure(let error):
				print(error)
			}
		}

		
	}

}

