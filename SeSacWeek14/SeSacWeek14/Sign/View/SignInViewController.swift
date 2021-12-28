//
//  ViewController.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/27.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
	
	let mainView = SignInView()
	var viewModel = SignInViewModel()
	
	override func loadView() {
		self.view = mainView
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		viewModel.userName.bind { text in
			self.mainView.usernameTextField.text = UserDefaults.standard.string(forKey: "username")
		}
		viewModel.userName.bind { text in
			self.mainView.passwordTextField.text = UserDefaults.standard.string(forKey: "password")
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewModel.userName.bind { text in
			self.mainView.usernameTextField.text = text
		}
		
		viewModel.password.bind { text in
			self.mainView.passwordTextField.text = text
		}
		
		mainView.usernameTextField.addTarget(self, action: #selector(userNameTextfieldDidChange(_:)), for: .editingChanged)
		
		mainView.passwordTextField.addTarget(self, action: #selector(userPasswordTextfieldDidChagne(_:)), for: .editingChanged)
		
		mainView.signInButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
		
		mainView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
	}
	
	@objc func userNameTextfieldDidChange(_ textfield: UITextField) {
		viewModel.userName.value = textfield.text ?? ""
	}
	
	@objc func userPasswordTextfieldDidChagne(_ textfield: UITextField) {
		viewModel.password.value = textfield.text ?? ""
	}
	
	@objc func signButtonClicked() {
		print(#function)
		print(viewModel.password.value)
		viewModel.postUserLogin {
			DispatchQueue.main.async {
				guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
				windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
				windowScene.windows.first?.makeKeyAndVisible()
			}
		}
	}
	
	@objc func signUpButtonClicked() {
		print(#function)
		navigationController?.pushViewController(SignUpViewController(), animated: true)
	}
}

