//
//  secondVC.swift
//  TabbarExample
//
//  Created by Hoo's MacBookPro on 2022/01/27.
//

import UIKit
import SnapKit

class secondVC: UIViewController {
	
	let testView = UIView()
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print("second",#function)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
		setupConstraint()
		print("second",#function)
	}
	
	func setupConstraint() {
		testView.backgroundColor = .green
		view.addSubview(testView)
		testView.snp.makeConstraints {
			$0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.5)
			$0.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
			$0.leading.top.equalTo(view.safeAreaLayoutGuide)
		}
	}
}
