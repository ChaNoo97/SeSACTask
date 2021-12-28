//
//  MainviewModel.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/28.
//

import Foundation

class MainViewMode {
	
	var text: Observable<String> = Observable("text")
	var userName: Observable<String> = Observable("username")
	var email: Observable<String> = Observable("email")
	
	
	let userToken = UserDefaults.standard.string(forKey: "token")!
	
	func featchBoardData() {
		print(userToken)
		APIService.board(token: userToken) { board, error in
			guard let board = board else {
				print("apiError")
				return
			}
			print(board)
			self.text.value = board.first?.text ?? "error"
			self.userName.value = board.first?.usersPermissionsUser.username ?? "error"
			self.email.value = board.first?.usersPermissionsUser.email ?? "error"
		}
	}
}
