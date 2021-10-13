//
//  placeholder.swift
//  ssacflex2
//
//  Created by Hoo's MacBookAir on 2021/09/30.
//

import Foundation
import UIKit
public extension UITextField{
	
	func setPlaceholderColor(_ placeholderColor: UIColor){
		attributedPlaceholder = NSAttributedString(
			string: placeholder ?? "",
			attributes: [
				.foregroundColor: placeholderColor,
				.font: font
			].compactMapValues{ $0 }
		)
	}
}
