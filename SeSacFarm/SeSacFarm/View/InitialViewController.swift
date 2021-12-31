//
//  InitialViewController.swift
//  SeSacFarm
//
//  Created by Hoo's MacBookPro on 2021/12/31.
//

import UIKit
import SnapKit

class InitialViewController: BaseViewController {
	let mainView = InitialView()
	override func loadView() {
		self.view = mainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("view")

	}
	
	override func configure() {
		super.configure()
	}
}
