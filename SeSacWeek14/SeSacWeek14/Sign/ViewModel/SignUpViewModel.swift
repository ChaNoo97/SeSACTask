//
//  SignUpViewModel.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/28.
//

import Foundation

class SignUpViewModel {
	
	var userName: Observable<String> = Observable("이름")
	var email: Observable<String> = Observable("이메일")
	var password: Observable<String> = Observable("비밀번호")
	
	func postUserSignUp(completion: @escaping () -> Void) {
		APIService.signUp(username: userName.value, email: email.value, password: password.value) { userData, error in
			guard let userData = userData else {
				return
			}
			UserDefaults.standard.set(userData.user.username, forKey: "username")
			UserDefaults.standard.set(self.password.value, forKey: "password")
			completion()
		}
	}
}
