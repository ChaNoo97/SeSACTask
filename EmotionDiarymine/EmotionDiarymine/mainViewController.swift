//
//  mainViewController.swift
//  EmotionDiarymine
//
//  Created by Hoo's MacBookAir on 2021/10/06.
//

import UIKit

class mainViewController: UIViewController {

	@IBOutlet weak var Label1: UILabel!
	@IBOutlet weak var Label2: UILabel!
	@IBOutlet weak var Label3: UILabel!
	@IBOutlet weak var Label4: UILabel!
	@IBOutlet weak var Label5: UILabel!
	@IBOutlet weak var Label6: UILabel!
	@IBOutlet weak var Label7: UILabel!
	@IBOutlet weak var Label8: UILabel!
	@IBOutlet weak var Label9: UILabel!
	
	@IBOutlet weak var clearButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		clearButton.setTitle("Clear", for: .normal)
		clearButton.setTitleColor(.black, for: .normal)
		clearButton.layer.cornerRadius = 10
		clearButton.layer.borderColor = UIColor.black.cgColor
		clearButton.layer.borderWidth = 2
		
		let number1 = UserDefaults.standard.integer(forKey: "number1")
		let number2 = UserDefaults.standard.integer(forKey: "number2")
		let number3 = UserDefaults.standard.integer(forKey: "number3")
		let number4 = UserDefaults.standard.integer(forKey: "number4")
		let number5 = UserDefaults.standard.integer(forKey: "number5")
		let number6 = UserDefaults.standard.integer(forKey: "number6")
		let number7 = UserDefaults.standard.integer(forKey: "number7")
		let number8 = UserDefaults.standard.integer(forKey: "number8")
		let number9 = UserDefaults.standard.integer(forKey: "number9")
		
		labelDesgin(lbl: Label1, labelWord: "행복해\(number1)", fontSize: 20)
		labelDesgin(lbl: Label2, labelWord: "사랑해\(number2)", fontSize: 20)
		labelDesgin(lbl: Label3, labelWord: "좋아해\(number3)", fontSize: 20)
		labelDesgin(lbl: Label4, labelWord: "당황해\(number4)", fontSize: 20)
		labelDesgin(lbl: Label5, labelWord: "속상해\(number5)", fontSize: 20)
		labelDesgin(lbl: Label6, labelWord: "우울해\(number6)", fontSize: 20)
		labelDesgin(lbl: Label7, labelWord: "심심해\(number7)", fontSize: 20)
		labelDesgin(lbl: Label8, labelWord: "심심해\(number8)", fontSize: 20)
		labelDesgin(lbl: Label9, labelWord: "속상해\(number9)", fontSize: 20)
		
		
    }
	
	
	func labelDesgin(lbl:UILabel, labelWord : String , fontSize : CGFloat){
		lbl.font = UIFont.systemFont(ofSize: fontSize)
		lbl.text = labelWord
		lbl.textColor = .black
		lbl.textAlignment = .center
	}
	
	func clearButton(numbername:String, lbl:UILabel, text:String){
		UserDefaults.standard.set(0, forKey: numbername)
		let num = UserDefaults.standard.integer(forKey: numbername)
		lbl.text = text+"\(num)"
	}
	
	@IBAction func button1Clicked(_ sender: UIButton) {
		let number = UserDefaults.standard.integer(forKey: "number1")
		UserDefaults.standard.set(number + 1, forKey: "number1")
		let updatenumber = UserDefaults.standard.integer(forKey: "number1")
		Label1.text = "행복해\(updatenumber)"
	}
	
	@IBAction func button2Clicked(_ sender: UIButton) {
		let number = UserDefaults.standard.integer(forKey: "number2")
		UserDefaults.standard.set(number + 1, forKey: "number2")
		let updatenumber = UserDefaults.standard.integer(forKey: "number2")
		Label2.text = "사랑해\(updatenumber)"
	}
	
	@IBAction func button3Clicked(_ sender: UIButton) {
		let number = UserDefaults.standard.integer(forKey: "number3")
		UserDefaults.standard.set(number + 1, forKey: "number3")
		let updatenumber = UserDefaults.standard.integer(forKey: "number3")
		Label3.text = "좋아해\(updatenumber)"
	}
	
	@IBAction func clearButtonClicked(_ sender: UIButton) {
		let alert = UIAlertController(title: "알림", message: "초기화 하시겠습니까?", preferredStyle: .alert)
		let close = UIAlertAction(title: "취소", style: .default)
		let confirm = UIAlertAction(title: "초기화", style: .destructive){_ in 
			self.clearButton(numbername: "number1", lbl: self.Label1, text: "행복해")
			self.clearButton(numbername:"number2", lbl:self.Label2, text:"사랑해")
			self.clearButton(numbername: "number3", lbl: self.Label3, text: "좋아해")
		}
		alert.addAction(confirm)
		alert.addAction(close)
		present(alert,animated:true,completion:nil)
		
	}
	
}
