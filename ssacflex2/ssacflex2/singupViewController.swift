//
//  singupViewController.swift
//  ssacflex2
//
//  Created by Hoo's MacBookAir on 2021/09/30.
//

import UIKit

class singupViewController: UIViewController {

	@IBOutlet var rootView: UIView!
	@IBOutlet weak var email: UITextField!
	@IBOutlet weak var password: UITextField!
	@IBOutlet weak var nickname: UITextField!
	@IBOutlet weak var code: UITextField!
	@IBOutlet weak var place: UITextField!
	@IBOutlet weak var singupButton: UIButton!
	@IBOutlet weak var bottomSwitch: UISwitch!
	
	override func viewDidLoad() {
		
        super.viewDidLoad()
		
		email.backgroundColor = .lightGray
		email.placeholder = "이메일 주소 또는 전화번호"
		email.setPlaceholderColor(.white)
		email.keyboardType = .emailAddress
		
		password.backgroundColor = .lightGray
		password.placeholder = "비밀번호"
		password.setPlaceholderColor(.white)
		password.isSecureTextEntry = true
		
		nickname.backgroundColor = .lightGray
		nickname.placeholder = "닉네임"
		nickname.setPlaceholderColor(.white)
		
		code.backgroundColor = .lightGray
		code.placeholder = "추천 코드 입력"
		code.setPlaceholderColor(.white)
		code.keyboardType = .numberPad
		
		place.backgroundColor = .lightGray
		place.placeholder = "위치"
		place.setPlaceholderColor(.white)
		
		singupButton.setTitle("회원가입", for: .normal)
		singupButton.setTitleColor( .black, for: .normal)
		singupButton.backgroundColor = .white
		
		bottomSwitch.setOn(true, animated: true)
		
    }
//	func textfieldUISetting(txt :UITextField, textward: String){
//		txt.placeholder = textward
//	}
	
	
	@IBAction func bottomSwitchTap(_ sender: Any) {
		if bottomSwitch.isOn {
			email.isHidden = true
		} else {
			email.isHidden = false
		}
		
	}
	
	
	@IBAction func tap(_ sender: Any) {
		rootView.endEditing(true)
	}
	
    
}
