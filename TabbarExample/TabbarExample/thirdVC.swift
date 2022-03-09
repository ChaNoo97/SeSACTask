//
//  thirdVC.swift
//  TabbarExample
//
//  Created by Hoo's MacBookPro on 2022/01/27.
//

import UIKit
import SnapKit

class thirdVC: UIViewController {
	
	let button = UIButton()
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print("third",#function)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .cyan
		print("third",#function)
		
		view.addSubview(button)
		button.backgroundColor = .brown
		button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
		button.snp.makeConstraints {
			$0.centerX.equalTo(view.safeAreaLayoutGuide)
			$0.top.equalTo(view.snp.top)
			$0.size.equalTo(50)
		}
	}
	
	@objc func buttonClicked() {
		let vc = fourVC()
		navigationController?.pushViewController(vc, animated: true)
	}
	
}
