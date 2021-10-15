//
//  MemoDetail2ViewController.swift
//  ssac1015
//
//  Created by Hoo's MacBookAir on 2021/10/15.
//

import UIKit

class MemoDetail2ViewController: UIViewController {

	@IBOutlet weak var memoLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		let memo = "memoDetail2"
		labelSetting(lbl: memoLabel, text: memo)
    }
    
}
