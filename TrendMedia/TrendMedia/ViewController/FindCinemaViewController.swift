//
//  FindCinemaViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/20.
//

import UIKit
import MapKit

class FindCinemaViewController: UIViewController {

	@IBOutlet weak var mapView: MKMapView!
	
	let locationManager = CLLocationManager()
	let theaterinfo = TheaterData()
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		//어노테이션 설정
//		let annotation = MKPointAnnotation()
//		annotation.title = "City Hall"
//		annotation.coordinate = location
//		mapView.addAnnotation(annotation)
		//주소로 표기
		let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonClicked))
		self.navigationItem.rightBarButtonItem = filterButton
		navigationItem.title = "주소"
		showAllTheater()
		
		
		mapView.delegate = self
		locationManager.delegate = self
    }
	
	@objc func filterButtonClicked() {
//		mapView.removeAnnotations(mapView.annotations)
		let actionSheet = UIAlertController(title: "영화관 선택", message: "영화관을 선택하세요", preferredStyle: .actionSheet)
		let selectCGV = UIAlertAction(title: "CGV", style: .default) { action in
			self.showSelectCinema(choose: 1)
		}
		let selectMEGABOX = UIAlertAction(title: "메가박스", style: .default) { action in
			self.showSelectCinema(choose: 2)
		}
		let selectLOTTE = UIAlertAction(title: "롯데시네마", style: .default) { action in
			self.showSelectCinema(choose: 3)
		}
		let selectAll = UIAlertAction(title: "전체보기", style: .cancel) { action in
			self.mapView.removeAnnotations(self.mapView.annotations)
			self.showAllTheater()
		}
		actionSheet.addAction(selectAll)
		actionSheet.addAction(selectCGV)
		actionSheet.addAction(selectLOTTE)
		actionSheet.addAction(selectMEGABOX)

		present(actionSheet, animated: true, completion: nil)
	}
	
	func findAddr(lat: CLLocationDegrees, long: CLLocationDegrees) {
		let findLocation = CLLocation(latitude: lat, longitude: long)
		let geocoder = CLGeocoder()
		let locale = Locale(identifier: "ko-kr")
		
		geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale) { (placemarks, error) in
			if let address: [CLPlacemark] = placemarks {
				if let name: String = address.last?.name{self.navigationItem.title = name}
			}
		}
	
	}
	func showSelectCinema(choose: Int) {
		mapView.removeAnnotations(mapView.annotations)
		for data in theaterinfo.mapAnnotations {
			let annotation = MKPointAnnotation()
			if choose == 1 {
				if data.type == "CGV" {
					let location = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
					annotation.title = data.location
					annotation.coordinate = location
					mapView.addAnnotation(annotation)
				}
			} else if choose == 2 {
				if data.type == "메가박스" {
					let location = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
					annotation.title = data.location
					annotation.coordinate = location
					mapView.addAnnotation(annotation)
				}
			} else {
				if data.type == "롯데시네마" {
					let location = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
					annotation.title = data.location
					annotation.coordinate = location
					mapView.addAnnotation(annotation)
				}
			}
		}
	}
	
	func showAllTheater() {
		for data in theaterinfo.mapAnnotations {
			let annotation = MKPointAnnotation()
			let location = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
			annotation.title = data.location
			annotation.coordinate = location
			mapView.addAnnotation(annotation)
		}
	}
	
}
extension FindCinemaViewController: MKMapViewDelegate {
	//어노테이션 클릭시 이벤트 핸들링
	func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
		
	}
}

extension FindCinemaViewController: CLLocationManagerDelegate {
	
	func checkUserLocationserviceAuthorization() {
		let authorizationStutas: CLAuthorizationStatus
		
		if #available(iOS 14.0 , *) {
			authorizationStutas = locationManager.authorizationStatus
		} else {
			authorizationStutas = CLLocationManager.authorizationStatus()
		}
		
		// ios 위치서비스 확인
		if CLLocationManager.locationServicesEnabled() {
			checkCurrentLocationAuthorization(authorizationStutas)
		} else {
			//ios 위치서비스 꺼져있으니 켜주세요 하는 알람
			// 설정창으로 이동
			print("iOS 위치 서비스를 켜주세요")
		}
	}
	
	func checkCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
		switch authorizationStatus {
		case .notDetermined:
			locationManager.desiredAccuracy = kCLLocationAccuracyBest
			locationManager.requestWhenInUseAuthorization()
			locationManager.startUpdatingLocation()
		case .restricted, .denied:
			
			print("denied")
			let alert = UIAlertController(title: "위치정보", message: "사용자의 위치추적을 허용해 주세요.", preferredStyle: .alert)
			let cancleAcction = UIAlertAction(title: "다음에", style: .default) { Action in
				self.locationManager.startUpdatingLocation()
			}
			let defaultAcction = UIAlertAction(title: "허용", style: .cancel) {
				Action in
				guard let url = URL(string: UIApplication.openSettingsURLString) else {
					return
				}
				if UIApplication.shared.canOpenURL(url){
					UIApplication.shared.open(url)
			 }
			}
			alert.addAction(cancleAcction)
			alert.addAction(defaultAcction)
			present(alert, animated: true, completion: nil)
		case .authorizedAlways:
			print("Always")
		case .authorizedWhenInUse:
			locationManager.startUpdatingLocation()
		@unknown default:
			print("default")
		}
		
		//위치 정확도
		if #available(iOS 14.0 , *) {
			let accurancyState = locationManager.accuracyAuthorization
			
			switch accurancyState {
			case .fullAccuracy:
				print("FULL")
			case .reducedAccuracy:
				print("REDUCE")
			@unknown default:
				print("DEFAULT")
			}
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		print(locations)
		
		if let coordinate = locations.last?.coordinate {
			let annotation = MKPointAnnotation()
			annotation.title = "CURRENT LOCATION"
			annotation.coordinate = coordinate
			mapView.addAnnotation(annotation)
			
			let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
			let region = MKCoordinateRegion(center: coordinate, span: span)
			mapView.setRegion(region, animated: true)
			
			findAddr(lat: coordinate.latitude, long: coordinate.longitude)
	
			
			locationManager.stopUpdatingLocation()
		} else {
			print("Location did not found")
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(#function)
		let location = CLLocationCoordinate2D(latitude: 37.56762032301884, longitude: 126.97754967834454)
		let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
		let region = MKCoordinateRegion(center: location, span: span)
		mapView.setRegion(region, animated: true)
	}
	
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		checkUserLocationserviceAuthorization()
	}
	
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		checkUserLocationserviceAuthorization()
	}
}
