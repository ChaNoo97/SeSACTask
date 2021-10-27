//
//  VisionAPIViewController.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/27.
//

import UIKit

class VisionAPIViewController: UIViewController {

	@IBOutlet weak var postImageView: UIImageView!
	
	@IBOutlet weak var resultLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		VisionAPIManager.shared.fetchFaceData(image: postImageView.image!) { code, json in
			print(json)
		}
    }
    
	@IBAction func requestButtonClicked(_ sender: UIButton) {
	}
	
}
