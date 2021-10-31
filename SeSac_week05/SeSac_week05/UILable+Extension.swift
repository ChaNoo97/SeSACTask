//
//  UILable+Extension.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/29.
//

import Foundation
import UIKit

extension UILabel {
	func setBorderStyle() {
		self.backgroundColor = .blue
		self.clipsToBounds = true
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.green.cgColor
	}
}
