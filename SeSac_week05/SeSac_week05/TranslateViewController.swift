//
//  TranslateViewController.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/26.
//

import UIKit
import Network

import Alamofire
import SwiftyJSON


class TranslateViewController: UIViewController {

	@IBOutlet weak var sourceTextField: UITextView!
	
	@IBOutlet weak var tragetTextField: UITextView!
	
	var translateText: String = "" {
		didSet {
			tragetTextField.text = translateText
		}
	}
	
	//네트워크 변경 감지 클래스
	let networkMoniter = NWPathMonitor()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		//네트워크 변경 감지 클래스를 통해 사용자의 네트워크 상태가 변경될 때마다 확인
		networkMoniter.pathUpdateHandler = { path in
			if path.status == .satisfied {
				print("Network Conneted")
				
				if path.usesInterfaceType(.cellular) {
					print("Celluar Status")
				} else if path.usesInterfaceType(.wifi) {
					print("Celluar Wifi")
				} else {
					print("Other")
				}
				
			} else {
				//toste 메세지? (가볍게)
				print("Network Disconneted")
			}
		}
		networkMoniter.start(queue: DispatchQueue.global())
    }
	
	
	@IBAction func translateButton(_ sender: UIButton) {
		
		//1. 옵셔널 바인딩
//		if let value = sourceTextField.text { //중괄호 안에서만 사용가능
//			TranslatedAPIManager.shared.fetchTranslateData(text: sourceTextField.text!)
//		}
		
		//2. 옵셔널 바인딩
		guard let text = sourceTextField.text else { //함수 전체 사용가능
			return }
		TranslatedAPIManager.shared.fetchTranslateData(text: text) { code, json in
			
			switch code {
			case 200:
				print(json)
				self.translateText = json["message"]["result"]["translatedText"].stringValue
			case 400:
				print(json)
				self.translateText = json["errorMessage"].stringValue
			default:
				print("Error")
		}
			
		}
		
		

	}
	
}
