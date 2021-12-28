//
//  SignView.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/27.
//

import UIKit
import SnapKit

protocol ViewRepresentable {
	func setupView()
	func setupConstraints()
}

class SignInView: UIView, ViewRepresentable {
	let usernameTextField = UITextField()
	let passwordTextField = UITextField()
	let signInButton = UIButton()
	let signUpButton = UIButton()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	func setupView() {
		addSubview(usernameTextField)
		usernameTextField.backgroundColor = .white
		addSubview(passwordTextField)
		passwordTextField.backgroundColor = .white
		addSubview(signInButton)
		signInButton.backgroundColor = .orange
		addSubview(signUpButton)
		signUpButton.backgroundColor = .red
		signUpButton.setTitle("회원가입", for: .normal)
	}
	
	func setupConstraints() {
		usernameTextField.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.width.equalTo(self.snp.width).multipliedBy(0.9)
			$0.height.equalTo(50)
		}
		
		passwordTextField.snp.makeConstraints {
			$0.top.equalTo(usernameTextField.snp.bottom).offset(20)
			$0.centerX.equalToSuperview()
			$0.width.equalTo(usernameTextField.snp.width)
			$0.height.equalTo(50)
		}
		
		signInButton.snp.makeConstraints {
			$0.top.equalTo(passwordTextField.snp.bottom).offset(20)
			$0.centerX.equalToSuperview()
			$0.width.equalTo(usernameTextField.snp.width)
			$0.height.equalTo(50)
		}
		
		signUpButton.snp.makeConstraints {
			$0.top.equalTo(signInButton.snp.bottom).offset(20)
			$0.centerX.equalToSuperview()
			$0.width.equalTo(usernameTextField.snp.width)
			$0.height.equalTo(50)
		}
		
	}
	
}
