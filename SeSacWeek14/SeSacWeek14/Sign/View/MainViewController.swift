//
//  MainViewController.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/27.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
	let mainview = MainView()
	let mainModel = MainViewMode()
	
	override func loadView() {
		self.view = mainview
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		mainModel.featchBoardData()
		
		mainModel.userName.bind { text in
			self.mainview.userNameLabel.text = text
		}
		mainModel.email.bind { text in
			self.mainview.emailLabel.text = text
		}
		mainModel.text.bind { text in
			self.mainview.textLabel.text = text
		}
	}
	
}
