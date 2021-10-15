//
//  MemoDetailViewController.swift
//  ssac1015
//
//  Created by Hoo's MacBookAir on 2021/10/15.
//

import UIKit

class MemoDetailViewController: UIViewController {

	@IBOutlet weak var memoLabel: UILabel!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		let memo = "memoDetial"
		labelSetting(lbl: memoLabel, text: memo)
    }
    
}
