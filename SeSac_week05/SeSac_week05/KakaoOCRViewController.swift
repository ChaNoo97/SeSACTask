//
//  KakaoOCRViewController.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/27.
//

import UIKit
import SwiftyJSON

class KakaoOCRViewController: UIViewController {

	@IBOutlet weak var sorceImage: UIImageView!
	
	@IBOutlet weak var resultTextView: UITextView!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		ocrManager.shared.fetchOCRData(image: sorceImage.image!
		) { code, json in
			var words: [String] = []
			let data = json["result"]
			var statement = ""
			for i in 0...data.count-1 {
				words.append(data[i]["recognition_words"][0].stringValue)
				statement = "\(statement) " +  data[i]["recognition_words"][0].stringValue
			}
		
			self.resultTextView.text = statement
			
		}
       
    }
    
	@IBAction func requestButtonClicked(_ sender: UIButton) {
	}
	
	
	
}
