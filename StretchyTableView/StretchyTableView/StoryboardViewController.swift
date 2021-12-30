//
//  StoryboardViewController.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/23.
//

import UIKit

class StoryboardViewController: UIViewController {
	

	override func viewDidLoad() {
        super.viewDidLoad()
		print("#function")
		
		var count = 0
		for i in 0...10 {
			count += i
			print(count)
		}
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		print(#function)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		print(#function)
	}
	
	/// - parameters message:메세지, conpletion: 실행이후
	/// - important hello
	/// - returns 닉네임 전달 해야함
	/// - **콜수제한**
	/// - 나이: 한국나이 사이트 참고 [바로가기](https://www.apple.com)
	func welcome(message: String, completion: @escaping () -> Void) -> String {
		return ""
	}
	

}

class User {
	
	var name: String
	var age: Int
	var email: String
	var review: String
	
	internal init(name: String, age: Int, email: String, review: String) {
		self.name = name
		self.age = age
		self.email = email
		self.review = review
	}
	
}















