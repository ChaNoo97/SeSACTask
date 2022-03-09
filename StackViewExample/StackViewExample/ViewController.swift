//
//  ViewController.swift
//  StackViewExample
//
//  Created by Hoo's MacBookPro on 2022/02/06.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
	
	let stackView = UIStackView()
	let firstView = UIView()
	let secondView = UIView()
	let thirdView = UIView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpConstraint()
		configure()
		stackViewConfigure()
	}
	
	func stackViewConfigure() {
		stackView.axis = .vertical
		stackView.distribution = .fill
		stackView.alignment = .leading
//	    stackView.spacing = 10
	}
	

	func setUpConstraint() {
		view.addSubview(stackView)
		
		[firstView, secondView, thirdView].forEach {
			stackView.addArrangedSubview($0)
		}
		
		stackView.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.height.equalTo(300)
			$0.width.equalTo(200)
		}
		
		firstView.snp.makeConstraints {
			$0.height.equalTo(50)
			$0.width.equalTo(50)
		}
		
		secondView.snp.makeConstraints {
			$0.height.equalTo(100)
			$0.width.equalTo(100)
		}
		
		thirdView.snp.makeConstraints {
			$0.height.equalTo(150)
			$0.width.equalTo(150)
		}
	}
	
	func configure() {
		view.backgroundColor = .white
		stackView.backgroundColor = .black
		
		firstView.backgroundColor = .red
		secondView.backgroundColor = .green
		thirdView.backgroundColor = .blue
		
	}

}

