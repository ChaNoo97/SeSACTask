//
//  DatePickerViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/05.
//

import UIKit

class DatePickerViewController: UIViewController {

	@IBOutlet weak var datePicker: UIDatePicker!
	override func viewDidLoad() {
        super.viewDidLoad()
		
		
		datePicker.preferredDatePickerStyle = .wheels
		datePicker.datePickerMode = .date
		datePicker.locale = Locale(identifier: "ko-kr")
	}
    


}
