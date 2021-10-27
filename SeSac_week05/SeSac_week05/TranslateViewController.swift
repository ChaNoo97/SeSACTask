//
//  TranslateViewController.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/26.
//

import UIKit
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
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		
	
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
