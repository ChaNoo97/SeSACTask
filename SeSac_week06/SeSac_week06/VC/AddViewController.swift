//
//  AddViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButton))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButton))
		navigationItem.title = "일기 작성"
        
    }
    
	@objc func backButton() {
		dismiss(animated: true, completion: nil)
	}
	
	@objc func saveButton() {
		
	}

}
