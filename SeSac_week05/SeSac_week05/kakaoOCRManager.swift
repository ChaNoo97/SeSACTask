//
//  kakaoOCRManager.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/27.
//

import Foundation
import SwiftyJSON
import Alamofire
import UIKit

struct ocrManager {
	static let shared = ocrManager()
	
	func fetchOCRData(image: UIImage, result: @escaping (Int,JSON) -> () ) {
		
		let header: HTTPHeaders = [
			"Authorization": APIkey.KAKAO
		]
		
		guard let imageData = image.pngData() else { return }
		
		AF.upload(multipartFormData: { multipartFormData in
			multipartFormData.append(imageData, withName: "image", fileName: "image")
			
		}, to: Endpoint.ocrURL, headers: header)
			.validate().validate(statusCode: 200...500).responseJSON { response in
				switch response.result {
				case .success(let value):
					let json = JSON(value)
					print("JSON: \(json)")
					let code = response.response?.statusCode ?? 500
					result(code, json)
				case .failure(let error):
					print(error)
				}
			}

		
	}
}
