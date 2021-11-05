//
//  AddViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
	@IBOutlet weak var writeTitleTextField: UITextField!
	@IBOutlet weak var writeContentTextView: UITextView!
	@IBOutlet weak var contentImageView: UIImageView!
	
	@IBOutlet weak var dateButton: UIButton!
	let localRealm = try! Realm()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButton))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButton))
		navigationItem.title = "일기 작성"
        
		print("Realm is located at:", localRealm.configuration.fileURL!)
    }
    
	@objc func backButton() {
		dismiss(animated: true, completion: nil)
	}
	
	@objc func saveButton() {
		
		

		let format = DateFormatter()
		format.dateFormat = "yyyy년 MM월 dd일"
		
//		let date = dateButton.currentTitle!
//		let value = format.date(from: date)!
	
		guard let date = dateButton.currentTitle, let value = format.date(from: date) else{ return }
		
		let task = UserDiary(diaryTitle: writeTitleTextField.text!, diaryContent: writeContentTextView.text!, writeDate: value, regDate: Date())
		try! localRealm.write{
			localRealm.add(task)
			saveImageToDocumentdirectory(imageName: "\(task._id).jpg", image: contentImageView.image!)
		}
		
	}
	
	func saveImageToDocumentdirectory(imageName: String, image: UIImage) {
		//1. 이미지 저장할 경로 설정: 도큐먼트 폴더(.documentDirectory), FileManager
		//Desktop/jack/ios/folder
		guard let documentDirctory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
		
		//2. 이미지 파일 이름 & 최종 경로 설정
		//Desktop/jack/ios/folder/222.png
		let imageURL = documentDirctory.appendingPathComponent(imageName)
		
		
		//3. 이미지압축
		guard let data = image.jpegData(compressionQuality: 0.2) else { return }
		
		//4. 이미지 저장 : 동일한 경로에 이미지를 저장하게 될 경우, 덮어쓰기
		//4-1. 이미지 경로 여부 확인
		if FileManager.default.fileExists(atPath: imageURL.path) {
			
			//4-2 기존경로에 있던 이미지 삭제
			do {
				try FileManager.default.removeItem(at: imageURL)
				print("이미지 삭제 완료")
			} catch {
				print("이미지를 삭제하지 못했습니다.")
			}
		}
		
		//5. 이미지를 도큐먼틍에 저장
		do {
			try data.write(to: imageURL)
		} catch {
			print("이미지 저장 못함")
		}
		
	}
	@IBAction func dateButtonClicked(_ sender: UIButton) {
		let alert = UIAlertController(title: "날짜 선택", message: "날짜를 선택해 주세요", preferredStyle: .alert)
		//Alert Customizing
		// 왜 안나올까?
		// 1. 얼럿안에 들어와서 그런가?
		// 2. 스토리보드가 인식이 안되나? DatePickerViewController
		// 3. 스토리보드 씬 + 클래스 -> 화면전환 코드
//		let contentView = DatePickerViewController()
		guard let contentView = self.storyboard?.instantiateViewController(withIdentifier: "DatePickerViewController") as? DatePickerViewController else {
			
			print("DatePickerViewController에 오류가 있음")
			return
		}
		contentView.view.backgroundColor = .clear
//		contentView.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
		contentView.preferredContentSize.height = 200
		
		alert.setValue(contentView, forKey: "contentViewController")
		
		let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
		let ok = UIAlertAction(title: "확인", style: .default) { action in
			
			let format = DateFormatter()
			format.dateFormat = "yyyy년 MM월 dd일"
			let value = format.string(from: contentView.datePicker.date)
			
			//확인버튼을 눌렀을 때 버튼의 타이틀 변경
			self.dateButton.setTitle(value, for: .normal)
		}
		
		alert.addAction(cancle)
		alert.addAction(ok)
		self.present(alert, animated: true, completion: nil)
	}
	
}
