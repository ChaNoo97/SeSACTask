//
//  BaseViewController.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
	
	override func viewDidLoad() {
		configure()
		setupConstraints()
		print("base") 
	}
	
	
	func configure() {
		print("q3")
		view.backgroundColor = .white
	}
	
	func setupConstraints() {
		
	}
}
