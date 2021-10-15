//
//  LabelSetting.swift
//  ssac1015
//
//  Created by Hoo's MacBookAir on 2021/10/15.
//

import Foundation
import UIKit
extension UIViewController{
	func labelSetting(lbl: UILabel, text: String) {
		lbl.text = text
		lbl.textColor = .black
		lbl.textAlignment = .center
		lbl.font = .boldSystemFont(ofSize: 30)
	}
}
