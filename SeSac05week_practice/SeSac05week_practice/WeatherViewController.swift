//
//  WeatherViewController.swift
//  SeSac05week_practice
//
//  Created by Hoo's MacBookAir on 2021/10/25.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire
import SwiftyJSON
import Kingfisher


class WeatherViewController: UIViewController {
	
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var locationImageView: UIImageView!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var temperatureLabel: UILabel!
	@IBOutlet weak var humidityLabel: UILabel!
	@IBOutlet weak var windLabel: UILabel!
	@IBOutlet weak var weatherImageView: UIImageView!
	@IBOutlet weak var messageLabel: UILabel!
	
	@IBOutlet weak var shareButton: UIButton!
	@IBOutlet weak var refreshifyButton: UIButton!
	
	let locationManager = CLLocationManager()
	
	var currentLat: Double = 37.56638024190041
	var currentLong: Double = 126.97794709166578
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = .lightGray
		
		getCurrentWeather()
		
		dateLocationLabel(lbl: dateLabel, size: 13, text: "10월 24일 01시")
		dateLocationLabel(lbl: locationLabel, size: 15, text: "서울, 신림동")
		tintColor(img: locationImageView, btn1: shareButton, btn2: refreshifyButton)
		
		weatherInfoLabel(lbl: temperatureLabel, text: "지금은 몇도 에요")
		weatherInfoLabel(lbl: humidityLabel, text: "몇퍼만큼 습해요")
		weatherInfoLabel(lbl: windLabel, text: "바람이 불어요")
		weatherInfoLabel(lbl: messageLabel, text: "오늘도 빡코딩 하세요")
		weatherImageView.backgroundColor = .white
		weatherImageView.layer.cornerRadius = 10
		
		locationManager.delegate = self
    }
	@IBAction func refreshButtonClicked(_ sender: UIButton) {
		getCurrentWeather()
	}
	
	func tintColor(img: UIImageView, btn1 shareBtn: UIButton, btn2 refreshifyBtn: UIButton) {
		img.tintColor = .white
		shareBtn.tintColor = .white
		refreshifyBtn.tintColor = .white
	}
	
	func dateLocationLabel(lbl: UILabel, size: CGFloat, text: String) {
		lbl.textColor = .white
		lbl.font = .systemFont(ofSize: size)
		lbl.text = text
	}
	
	func weatherInfoLabel(lbl: UILabel, text: String) {
		lbl.text = " \(text) "
		lbl.backgroundColor = .white
		lbl.font = .boldSystemFont(ofSize: 15)
		lbl.textAlignment = .left
		lbl.layer.cornerRadius = 5
		lbl.clipsToBounds = true
		lbl.textColor = .black
		lbl.sizeToFit()
	}
	
	func findAddr(coordi: CLLocationCoordinate2D) {
			let geocoder = CLGeocoder()
			let findLocation = CLLocation(latitude: coordi.latitude, longitude: coordi.longitude)
			let locale = Locale(identifier: "Ko-kr")
			geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale, completionHandler: {(placemarks, error) in
				if let address : [CLPlacemark] = placemarks {
					let gu = address[0].locality
					let dong = address[0].name
					self.locationLabel.text = "\(gu!), \(dong!)"
				}
			})
		}
	func windDeg(deg: Int) -> String {
		var windDirection: String = ""
		switch deg {
		case 0...22:
			windDirection = "북풍"
		case 23...67:
			windDirection = "북동풍"
		case 68...112:
			windDirection = "동풍"
		case 113...157:
			windDirection = "남동풍"
		case 158...202:
			windDirection = "남풍"
		case 203...247:
			windDirection = "남서풍"
		case 248...292:
			windDirection = "서풍"
		case 293...337:
			windDirection = "북서풍"
		case 338...360:
			windDirection = "북풍"
		default:
			windDirection = "무풍"
		}
		return windDirection
	}
	
	func getCurrentWeather() {
//		let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(currentLat)&lon=\(currentLong)&appid=eee90f108f2fc83f5e8de93edeb85d64"
		
		WeatherAPIManager.shard.fetchWeatherData(lat: currentLat, long: currentLong, id: APIkey.weatherID) { json in
			
			let currentTemp = json["main"]["temp"].doubleValue - 273.15
			self.temperatureLabel.text = " 현재온도는 \(Int(currentTemp))ºc 입니다. "
			
			let currentHumdity = json["main"]["humidity"].doubleValue
			self.humidityLabel.text = " 습도는 \(Int(currentHumdity))% 입니다. "
			
			let currentWindDeg = Int(json["main"]["deg"].doubleValue)
			let currentWindSpeed = json["main"]["speed"].doubleValue
			let winddirec = self.windDeg(deg: currentWindDeg)
			self.windLabel.text = " 풍향은 \(winddirec) 풍속은 \(currentWindSpeed)m/s 입니다. "
			
			let icon = json["weather"][0]["icon"].stringValue
			let url = URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")
			self.weatherImageView.kf.setImage(with: url)
			
		}
		
//		AF.request(url, method: .get).validate().responseJSON { response in
//			switch response.result {
//			case .success(let value):
//				let json = JSON(value)
//				print("JSON: \(json)")
//
//				let currentTemp = json["main"]["temp"].doubleValue - 273.15
//				self.temperatureLabel.text = " 현재온도는 \(Int(currentTemp))ºc 입니다. "
//
//				let currentHumdity = json["main"]["humidity"].doubleValue
//				self.humidityLabel.text = " 습도는 \(Int(currentHumdity))% 입니다. "
//
//				let currentWindDeg = Int(json["main"]["deg"].doubleValue)
//				let currentWindSpeed = json["main"]["speed"].doubleValue
//				let winddirec = self.windDeg(deg: currentWindDeg)
//				self.windLabel.text = " 풍향은 \(winddirec) 풍속은 \(currentWindSpeed)m/s 입니다. "
//
//				let icon = json["weather"][0]["icon"].stringValue
//				let url = URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")
//				self.weatherImageView.kf.setImage(with: url)
//
//			case .failure(let error):
//				print(error)
//			}
//		}

	}

}


extension WeatherViewController: CLLocationManagerDelegate {
	
	func checkUserLocationServicesAuthorization() {
		let authorizationStatus: CLAuthorizationStatus
		
		if #available(iOS 14.0 , *) {
			authorizationStatus = locationManager.authorizationStatus
		} else {
			authorizationStatus = CLLocationManager.authorizationStatus()
		}
		
		if CLLocationManager.locationServicesEnabled() {
			checkCurrentLocationAuthorization(authorizationStatus)
		} else {
			print("ios 위치서비스를 켜주세요")
		}
	}
	
	func checkCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
		switch authorizationStatus {
		case .notDetermined:
			locationManager.desiredAccuracy = kCLLocationAccuracyBest
			locationManager.requestWhenInUseAuthorization()
			locationManager.startUpdatingLocation()
		case .denied, .restricted:
			//alert
			print("denied")
		case .authorizedAlways:
			print("always")
		case .authorizedWhenInUse:
			locationManager.startUpdatingLocation()
		@unknown default:
			print("default")
		}
		
		if #available(iOS 14.0 , *) {
			let accurancyState = locationManager.accuracyAuthorization
			switch accurancyState {
			case .fullAccuracy:
				print("full")
			case .reducedAccuracy:
				print("reduce")
			@unknown default:
				print("default")
			}
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if let coordinate = locations.last?.coordinate {
			locationManager.stopUpdatingLocation()
			currentLat = coordinate.latitude
			currentLong = coordinate.longitude
			
			findAddr(coordi: coordinate)
			
		} else {
			print("location cannot Find")
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(#function)
	}
	
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		
	}
	
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		checkUserLocationServicesAuthorization()
	}
}


