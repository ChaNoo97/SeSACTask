//
//  MovieDetailViewController.swift
//  SeSac_03week
//
//  Created by Hoo's MacBookAir on 2021/10/15.
//

import UIKit

class MovieDetailViewController: UIViewController,UITextViewDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
	
	let pickerList: [String] = ["감자","고구마","파인애플","자두", "복숭아"]
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 2
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return 5
	}
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		print(row)
	}
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerList[row]
	}
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var overviewTextView: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		//TextField InputView
//		let datePicker = UIDatePicker()
//		datePicker.preferredDatePickerStyle = .wheels
		
		//TextField InputView
		let pickerView = UIPickerView()
		pickerView.delegate = self
		pickerView.dataSource = self
		titleTextField.inputView = pickerView
		
		
		//텍스트뷰 플레이스홀더 연결
		overviewTextView.delegate = self
		
		//텍스트뷰 플레이스홀더: 글자, 글자 색상
		overviewTextView.text = "이곳에 줄거리를 남겨보세요"
		overviewTextView.textColor = .lightGray
		overviewTextView.textAlignment = .center
        
    }
	
	//커서 시작
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor == .lightGray {
			textView.text = nil
			textView.textColor = .black
		}
	}
	
	//커서 끝
	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = "이 곳에 줄거리를 남겨보세요"
			textView.textColor = .lightGray
		}
	}

}
