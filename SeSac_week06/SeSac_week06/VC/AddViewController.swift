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
		
		let task = UserDiary(diaryTitle: writeTitleTextField.text!, diaryContent: writeContentTextView.text!, writeDate: Date(), regDate: Date())
		try! localRealm.write{
			localRealm.add(task)
		}
		
	}

}
