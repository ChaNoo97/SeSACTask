//
//  VisionAPIManager.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/27.
//

import UIKit.UIImage //신기방기
import Alamofire
import SwiftyJSON

class VisionAPIManager {
	static let shared = VisionAPIManager()
	
	func fetchFaceData(image: UIImage, result: @escaping (Int, JSON) -> ()) {
		
		let header: HTTPHeaders = [
			"Authorization": APIkey.KAKAO
		   ]
		
		//UIImage를 바이너리 타입으로 변환
		guard let imageData = image.pngData() else { return }
		
		AF.upload(multipartFormData: { multipartFormData in
			multipartFormData.append(imageData, withName: "image", fileName: "image")
		}, to: Endpoint.visionURL, headers: header)
			.validate(statusCode: 200...500).responseJSON { response in
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
