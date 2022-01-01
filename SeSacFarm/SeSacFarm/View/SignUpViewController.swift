//
//  SignUpViewController.swift
//  SeSacFarm
//
//  Created by Hoo's MacBookPro on 2021/12/31.
//

import UIKit
import SnapKit

class SignUpViewController: BaseViewController {
	
	let mainView = SignUpView()
	override func loadView() {
		self.view = mainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = "새싹농장 가입하기"
		navigationController?.navigationBar.tintColor = .black
		
	}
	
	override func configure() {
		super.configure()
	}
	
	
}
