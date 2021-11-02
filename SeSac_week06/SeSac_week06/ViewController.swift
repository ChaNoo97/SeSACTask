//
//  ViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var welcomLabel: UILabel!
	@IBOutlet weak var backupRestoreLabel: UILabel!
	
	@IBOutlet weak var restoreButton: UIButton!
	@IBOutlet weak var backupButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//Font 이름 확인
		for family in UIFont.familyNames {
			print(family)
			
			for sub in UIFont.fontNames(forFamilyName: family) {
				print("====> \(sub)")
			}
		}
		/*
		S-Core Dream
		====> S-CoreDream-2ExtraLight
		====> S-CoreDream-5Medium
		====> S-CoreDream-9Black
		*/
		
		welcomLabel.text = LocalizableStrings.welcome_text.localized
//		welcomLabel.text = NSLocalizedString("data_backup", tableName: "setting", bundle: .main, value: "", comment: "")
		//보통 폰트 사이즈: CGFloat ==> 11~20"
		welcomLabel.font = UIFont().mainBlack
		
		backupRestoreLabel.text = LocalizableStrings.data_backup.localizedSetting
		
		
		backupButton.setTitle(LocalizableStrings.data_backup.localizedSetting, for: .normal)
		restoreButton.setTitle(LocalizableStrings.data_restore.localizedSetting, for: .normal)
//		backupButton.setTitle(NSLocalizedString("data_backup", tableName: "Setting", bundle: .main, value: "", comment: ""), for: .normal)
	}


}

