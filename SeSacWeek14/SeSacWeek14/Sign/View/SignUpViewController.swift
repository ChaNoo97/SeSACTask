//
//  SignUpViewController.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/28.
//

import UIKit

class SignUpViewController: UIViewController {
	
	let signUpview = SignUpView()
	let model = SignUpViewModel()
	
	override func loadView() {
		self.view = signUpview
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		model.userName.bind { text in
			self.signUpview.userNameTextField.text = text
		}
		model.email.bind { text in
			self.signUpview.emailTextField.text = text
		}
		model.password.bind { text in
			self.signUpview.passwordTextField.text = text
		}
		
		signUpview.userNameTextField.addTarget(self, action: #selector(userNameTextFieldDidChange(_:)), for: .editingChanged)
		signUpview.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
		signUpview.emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
		
		signUpview.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
	}
	
	@objc func userNameTextFieldDidChange(_ textfield: UITextField) {
		model.userName.value = textfield.text ?? ""
	}
	
	@objc func passwordTextFieldDidChange(_ textfield: UITextField) {
		model.password.value = textfield.text ?? ""
	}
	@objc func emailTextFieldDidChange(_ textfield: UITextField) {
		model.email.value = textfield.text ?? ""
	}
	
	@objc func signUpButtonClicked() {
		model.postUserSignUp {
			DispatchQueue.main.async {
				self.navigationController?.popViewController(animated: true)
			}
		}
	}
	
}

