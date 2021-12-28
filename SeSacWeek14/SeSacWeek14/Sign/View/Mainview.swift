//
//  Mainview.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/28.
//

import UIKit
import SnapKit

class MainView: UIView, ViewRepresentable {
	let textLabel = UILabel()
	let userNameLabel = UILabel()
	let emailLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	func setupView() {
		[textLabel,userNameLabel,emailLabel].forEach {
			addSubview($0)
			$0.backgroundColor = .white
		}
		self.backgroundColor = .gray
	}
	
	func setupConstraints() {
		textLabel.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.width.equalToSuperview().multipliedBy(0.8)
			$0.height.equalTo(50)
		}
		
		userNameLabel.snp.makeConstraints {
			$0.top.equalTo(textLabel.snp.bottom).offset(20)
			$0.centerX.equalToSuperview()
			$0.height.equalTo(50)
			$0.width.equalTo(textLabel.snp.width)
		}
		
		emailLabel.snp.makeConstraints {
			$0.top.equalTo(userNameLabel.snp.bottom).offset(20)
			$0.centerX.equalToSuperview()
			$0.height.equalTo(50)
			$0.width.equalTo(userNameLabel.snp.width)
		}
	}
	
	
}
