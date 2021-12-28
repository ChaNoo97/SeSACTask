//
//  SingUpView.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/28.
//

import UIKit
import SnapKit

class SignUpView: UIView, ViewRepresentable {

	let userNameTextField = UITextField()
	let emailTextField = UITextField()
	let passwordTextField = UITextField()
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
		self.backgroundColor = .white
		[userNameTextField, emailTextField, passwordTextField, signUpButton].forEach {
			addSubview($0)
		}
		
		userNameTextField.placeholder = "userName"
		emailTextField.placeholder = "email"
		passwordTextField.placeholder = "password"
		
		[userNameTextField, emailTextField, passwordTextField].forEach {
			$0.backgroundColor = .white
		}
		signUpButton.backgroundColor = .red
	}
	
	func setupConstraints() {
		userNameTextField.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.width.equalToSuperview().multipliedBy(0.8)
			$0.height.equalTo(50)
		}
		
		emailTextField.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalTo(userNameTextField.snp.bottom).offset(20)
			$0.width.equalTo(userNameTextField.snp.width)
			$0.height.equalTo(50)
		}
		
		passwordTextField.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalTo(emailTextField.snp.bottom).offset(20)
			$0.width.equalTo(userNameTextField.snp.width)
			$0.height.equalTo(50)
		}
		
		signUpButton.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalTo(passwordTextField.snp.bottom).offset(20)
			$0.width.equalTo(userNameTextField.snp.width)
			$0.height.equalTo(50)
		}
	}
	
}
