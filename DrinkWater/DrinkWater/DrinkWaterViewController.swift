//
//  MainViewController.swift
//  DrinkWater
//
//  Created by Hoo's MacBookAir on 2021/10/10.
//

import UIKit

class DrinkWaterViewController: UIViewController {

	@IBOutlet var mainView: UIView!
	
	@IBOutlet weak var mainNavigationBar: UINavigationItem!
	@IBOutlet weak var leftItem: UIBarButtonItem!
	@IBOutlet weak var rightItem: UIBarButtonItem!
	@IBOutlet weak var topLabel: UILabel!
	@IBOutlet weak var middleLabel: UILabel!
	@IBOutlet weak var bottomLabel: UILabel!
	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var inputTextField: UITextField!
	@IBOutlet weak var infoLabel: UILabel!
	@IBOutlet weak var drinkButton: UIButton!
	
	let US = UserDefaults.standard
	var water = 0
	var percent = 0

	override func viewDidLoad() {
        super.viewDidLoad()
		
		mainView.backgroundColor = UIColor.init(red: 65/255, green: 148/255, blue: 114/255, alpha: 1)
		
		self.navigationController?.navigationBar.tintColor = .white
		mainNavigationBar.backButtonTitle = "물 마시기"
		mainNavigationBar.title = "물 마시기"
		leftItem.image = UIImage.init(systemName: "person.circle")
		rightItem.image = UIImage.init(systemName: "arrow.clockwise")
		
		// stackview
		labelDesign(lbl: topLabel, word: "잘하셨어요!\n오늘 마신 양은")
		topLabel.numberOfLines = 0
		topLabel.font = .systemFont(ofSize: 20)
		topLabel.textColor = textcolorsetting()
		
		labelDesign(lbl: middleLabel , word: "\(water)ml")
		middleLabel.font = .boldSystemFont(ofSize: 30)
		middleLabel.textColor = textcolorsetting()
		
		labelDesign(lbl: bottomLabel, word: "목표의\(percent)%")
		bottomLabel.font = .systemFont(ofSize: 15)
		bottomLabel.textColor = textcolorsetting()
		
		// center image
		mainImage.image = UIImage.init(named: imageSetting())
	
		// input text field
		inputTextField.backgroundColor = UIColor.init(red: 65/255, green: 148/255, blue: 114/255, alpha: 1)
		inputTextField.borderStyle = .none
		inputTextField.textColor = .white
		inputTextField.textAlignment = .center
		inputTextField.font = .systemFont(ofSize: 30)
		inputTextField.keyboardType = .numberPad
		inputTextField.attributedPlaceholder = NSAttributedString(string: "얼마나 마셨나요?",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
		
		// info label
		let nickname = US.string(forKey: "nickname")
		let wateral = US.double(forKey: "waterallowance")
		infoLabel.text = "\(nickname ?? "안녕하세요")님의 하루 물 권장 섭취량은 \(wateral)L 입니다."
		infoLabel.textColor = .white
		infoLabel.textAlignment = .center
		infoLabel.font = .systemFont(ofSize: 15)
		// 물마시기 버튼
		drinkButton.backgroundColor = .white
		drinkButton.setTitle("물 마시기\n", for: .normal)
		drinkButton.tintColor = .black
		
		
    }
	override func viewWillAppear(_ animated: Bool) {
		viewDidLoad()
	}
	
	@IBAction func refresh(_ sender: UIBarButtonItem) {
		let alert = UIAlertController(title: "알림", message: "초기화 하시겠습니까?", preferredStyle: .alert)
		let close = UIAlertAction(title: "취소", style: .default)
		let confirm = UIAlertAction(title: "초기화", style: .destructive) {_ in
			self.water = 0
			self.percent = 0
			self.viewDidLoad()
		}
		alert.addAction(confirm)
		alert.addAction(close)
		present(alert,animated:true,completion:nil)
		
	}
	@IBAction func drinkButton(_ sender: Any) {
		let input = Int(inputTextField.text!)
		water = water + (input ?? 0)
		US.integer(forKey: "todaywater")
		//옵셔널 아님
		US.set(water, forKey: "todaywater")
		inputTextField.text = ""
		
		let todayWater = (Double(US.integer(forKey: "todaywater"))/1000)
		let waterallowance = US.double(forKey: "waterallowance")
		percent = Int(((todayWater)/waterallowance)*100)
		US.integer(forKey: "percent")
		US.set(percent, forKey: "percent")

		viewDidLoad()
	}
	
	func imageSetting() ->String {
		percent = US.integer(forKey: "percent")
		if (percent < 10) {
			return "1.png"
		} else if (percent>=10 && percent<20) {
			return "2.png"
		} else if (percent>=20 && percent < 35) {
			return "3.png"
		} else if (percent>=35 && percent < 45) {
			return "4.png"
		} else if (percent>=45 && percent < 55) {
			return "5.png"
		} else if (percent>=55 && percent < 70) {
			return "6.png"
		} else if (percent>=70 && percent < 80) {
			return "7.png"
		} else if (percent>=80 && percent < 90) {
			return "8.png"
		} else {
			return "9.png"
		}
	}
	
	func textcolorsetting() -> UIColor {
		if (percent >= 100) {
			return .black
		} else {
			return .white
		}
	}
	
	func labelDesign(lbl:UILabel,word:String){
		lbl.text = word
		lbl.textAlignment = .left
	}

}
