//
//  firstVC.swift
//  TabbarExample
//
//  Created by Hoo's MacBookPro on 2022/01/27.
//

import UIKit
import SnapKit

class firstVC: UIViewController {
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print("first",#function)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
		print("first",#function)
	}
}
