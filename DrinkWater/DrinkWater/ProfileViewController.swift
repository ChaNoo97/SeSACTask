//
//  singupViewController.swift
//  DrinkWater
//
//  Created by Hoo's MacBookAir on 2021/10/10.
//

import UIKit
import TextFieldEffects

class ProfileViewController: UIViewController {

	@IBOutlet var mainview: UIView!
	
	
	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var nicknameTextField: HoshiTextField!
	@IBOutlet weak var heightTextField: HoshiTextField!
	@IBOutlet weak var weightTextField: HoshiTextField!
	
	@IBOutlet weak var saveButton: UIBarButtonItem!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		mainview.backgroundColor = UIColor.init(red: 65/255, green: 148/255, blue: 114/255, alpha: 1)
		
		saveButton.title = "저장"
		saveButton.tintColor = .white
		
		self.navigationController?.navigationBar.tintColor = .white

		let image = UIImage(named: "userimage.png")
		userImage.image = image
		
		TextfieldDesign(tf: nicknameTextField, word: "닉네임을 설정해 주세요")
		nicknameTextField.text = UserDefaults.standard.string(forKey: "nickname")
		
		TextfieldDesign(tf: heightTextField, word: "키(cm)을 설정해 주세요")
		heightTextField.keyboardType = .numberPad
		heightTextField.text = "\(UserDefaults.standard.integer(forKey: "height"))"
		
		TextfieldDesign(tf: weightTextField, word: "몸무게(kg)을 설정해 주세요")
		weightTextField.keyboardType = .numberPad
		weightTextField.text = "\(UserDefaults.standard.integer(forKey: "weight"))"
    }
	
	
	
    
	func TextfieldDesign(tf:HoshiTextField, word:String) {
		tf.backgroundColor = UIColor.init(red: 65/255, green: 148/255, blue: 114/255, alpha: 1)
		tf.borderStyle = UITextField.BorderStyle.none
		tf.placeholder = word
		tf.placeholderFontScale = 0.9
		tf.placeholderColor = UIColor.white
		tf.borderActiveColor = UIColor.white
		tf.borderInactiveColor = UIColor.white
		tf.textColor = UIColor.white
		tf.textAlignment = .left
		}
	
	
    
	@IBAction func saveButton(_ sender: UIBarButtonItem) {
		let US = UserDefaults.standard
		
		US.set(nicknameTextField.text, forKey: "nickname")
		let updateName = US.string(forKey: "nickname")
		nicknameTextField.text = updateName!
		
		US.set(heightTextField.text,forKey: "height")
		let updateHeight = US.integer(forKey: "height")
		heightTextField.text = "\(updateHeight)"
		
		US.set(weightTextField.text,forKey: "weight")
		let updateWeight = US.integer(forKey: "weight")
		weightTextField.text = "\(updateWeight)"
		
		let waterAL : Double = Double(round((Double(updateHeight+updateWeight)/10))/10)
		UserDefaults.standard.set(waterAL, forKey:"waterallowance")
		
		nicknameTextField.endEditing(true)
		heightTextField.endEditing(true)
		weightTextField.endEditing(true)
		
	}
	
	
	
}
