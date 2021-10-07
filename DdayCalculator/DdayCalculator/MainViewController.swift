//
//  MainViewController.swift
//  DdayCalculator
//
//  Created by Hoo's MacBookAir on 2021/10/07.
//

import UIKit

class MainViewController: UIViewController {

	@IBOutlet weak var datePicker: UIDatePicker!
	
	@IBOutlet weak var FirstView: UIView!
	@IBOutlet weak var FirstImageView: UIImageView!
	@IBOutlet weak var FirstViewTopLabel: UILabel!
	@IBOutlet weak var FirstViewCenterLabel: UILabel!
	
	@IBOutlet weak var SecondImageView: UIImageView!
	@IBOutlet weak var SecondViewTopLabel: UILabel!
	@IBOutlet weak var SecondViewCenterLabel: UILabel!
	
	@IBOutlet weak var ThirdImageView: UIImageView!
	@IBOutlet weak var ThirdViewTopLabel: UILabel!
	@IBOutlet weak var ThirdViewCenterLabel: UILabel!
	
	@IBOutlet weak var FourthImageView: UIImageView!
	@IBOutlet weak var FourthViewTopLabel: UILabel!
	@IBOutlet weak var FourthViewCenterLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		if #available(iOS 14.0, *) {
			datePicker.preferredDatePickerStyle = .inline
		} else if #available(iOS 13.4, *) {
			datePicker.preferredDatePickerStyle = .wheels
		}
		
		FirstImageView.layer.cornerRadius = 15
		SecondImageView.layer.cornerRadius = 15
		ThirdImageView.layer.cornerRadius = 15
		FourthImageView.layer.cornerRadius = 15
		
		topLabelDesign(lbl: FirstViewTopLabel, lblWord: "D+100")
		topLabelDesign(lbl: SecondViewTopLabel, lblWord: "D+200")
		topLabelDesign(lbl: ThirdViewTopLabel, lblWord: "D+300")
		topLabelDesign(lbl: FourthViewTopLabel, lblWord: "D+400")
		
		let format = DateFormatter()
		format.dateFormat = "yyyy년\nMM월dd일"
		
		let after100Date = Date(timeInterval: 86400*99, since: datePicker.date)
		let after200Date = Date(timeInterval: 86400*199, since: datePicker.date)
		let after300Date = Date(timeInterval: 86400*299, since: datePicker.date)
		let after400Date = Date(timeInterval: 86400*399, since: datePicker.date)
		
		let after100DateString = format.string(from: after100Date)
		let after200DateString = format.string(from: after200Date)
		let after300DateString = format.string(from: after300Date)
		let after400DateString = format.string(from: after400Date)
		
		centerLabelDesign(lbl: FirstViewCenterLabel, lblword: after100DateString, color: .black)
		centerLabelDesign(lbl: SecondViewCenterLabel, lblword: after200DateString, color: .black)
		centerLabelDesign(lbl: ThirdViewCenterLabel, lblword: after300DateString, color: .black)
		centerLabelDesign(lbl: FourthViewCenterLabel, lblword: after400DateString, color: .black)
	
	}
    
	@IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
		let format = DateFormatter()
		format.dateFormat = "yyyy년\nMM월dd일"
//		let currentTime = format.string(from: sender.date)
		//print(currentTime)
		let after100Date = Date(timeInterval: 86400*99, since: sender.date)
		let after200Date = Date(timeInterval: 86400*199, since: sender.date)
		let after300Date = Date(timeInterval: 86400*299, since: sender.date)
		let after400Date = Date(timeInterval: 86400*399, since: sender.date)
		
		let after100DateString = format.string(from: after100Date)
		let after200DateString = format.string(from: after200Date)
		let after300DateString = format.string(from: after300Date)
		let after400DateString = format.string(from: after400Date)
	
		FirstViewCenterLabel.text = after100DateString
		SecondViewCenterLabel.text = after200DateString
		ThirdViewCenterLabel.text = after300DateString
		FourthViewCenterLabel.text = after400DateString
		}
	
	func topLabelDesign(lbl: UILabel , lblWord: String){
		lbl.text = lblWord
		lbl.textColor = .white
		lbl.textAlignment = .center
		lbl.font = .boldSystemFont(ofSize: 20)
	}
	
	func centerLabelDesign(lbl: UILabel, lblword: String, color: UIColor) {
		lbl.text = lblword
		lbl.numberOfLines = 0
		lbl.textColor = color
		lbl.textAlignment = .center
		lbl.font = .boldSystemFont(ofSize: 20)
		lbl.backgroundColor = UIColor(displayP3Red: 241/255, green: 240/255, blue: 245/255, alpha: 97/100)
		lbl.layer.cornerRadius = 10
	}
}
