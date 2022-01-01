//
//  SignInViewController.swift
//  SeSacFarm
//
//  Created by Hoo's MacBookPro on 2022/01/01.
//

import UIKit
import SnapKit

class SignInViewController: BaseViewController {
	let mainView = SignInView()
	override func loadView() {
		self.view = mainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = "새싹농장 시작하기"
	}
	
}
