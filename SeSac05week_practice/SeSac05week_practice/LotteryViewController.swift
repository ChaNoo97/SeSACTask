//
//  LotteryViewController.swift
//  SeSac05week_practice
//
//  Created by Hoo's MacBookAir on 2021/10/27.
//

import UIKit
import SwiftyJSON
import Alamofire

class LotteryViewController: UIViewController {
	
	@IBOutlet weak var topTextField: UITextField!
	
	@IBOutlet weak var roundLabel: UILabel!
	@IBOutlet weak var num1Label: UILabel!
	@IBOutlet weak var num2Label: UILabel!
	@IBOutlet weak var num3Label: UILabel!
	@IBOutlet weak var num4Label: UILabel!
	@IBOutlet weak var num5Label: UILabel!
	@IBOutlet weak var num6Label: UILabel!
	@IBOutlet weak var bonusNumLabel: UILabel!
	
	
	@IBOutlet weak var roundPickerView: UIPickerView!
	
	
	var roundNum = 986
	var roundArray = Array<Int>(1...986)
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		topTextField.text = "\(roundNum)"
		topTextField.textAlignment = .center
		topTextField.font = .boldSystemFont(ofSize: 20)
		fetchData()
		roundLabel.text = "\(roundNum)회 당첨결과"
		roundLabel.textAlignment = .center
		roundLabel.textColor = .black
		roundLabel.font = .boldSystemFont(ofSize: 20)
		uppicketView()
    }
    
	func uppicketView() {
		let pickerView = UIPickerView()
		pickerView.delegate = self
		topTextField.inputView = pickerView
		
		
	}

	 
	func fetchData() {
		let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(roundNum)"
	
		AF.request(url, method: .get).validate().responseJSON { response in
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				print("JSON: \(json)")
				let num1 = json["drwtNo1"].intValue
				self.num1Label.text = "\(num1)"
				let num2 = json["drwtNo2"].intValue
				self.num2Label.text = "\(num2)"
				let num3 = json["drwtNo3"].intValue
				self.num3Label.text = "\(num3)"
				let num4 = json["drwtNo4"].intValue
				self.num4Label.text = "\(num4)"
				let num5 = json["drwtNo5"].intValue
				self.num5Label.text = "\(num5)"
				let num6 = json["drwtNo6"].intValue
				self.num6Label.text = "\(num6)"
				let bonusNum = json["bnusNo"].intValue
				self.bonusNumLabel.text = "\(bonusNum)"
			case .failure(let error):
				print(error)
			}
		}
	}

}

extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return roundArray.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return "\(roundArray[row])"
	}
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		topTextField.text = "\(row+1)"
		roundLabel.text = "\(row+1)회 당첨결과"
		roundNum = row+1
		fetchData()
	}
	
	
	

}
