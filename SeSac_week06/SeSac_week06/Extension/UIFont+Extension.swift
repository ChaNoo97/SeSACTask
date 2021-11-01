//
//  UIFont+Extension.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit

/*
S-Core Dream
====> S-CoreDream-2ExtraLight
====> S-CoreDream-5Medium
====> S-CoreDream-9Black
*/

extension UIFont {
	var SCDream2: UIFont {
		return UIFont(name: "S-CoreDream-2ExtraLight", size: 12)!
	}
	
	var SCDream4: UIFont {
		return UIFont(name: "S-CoreDream-4Regular", size: 14)!
	}
	
	var SCDream5: UIFont {
		return UIFont(name: "S-CoreDream-5Medium", size: 14)!
	}
	
	var mainBlack: UIFont {
		return UIFont(name: "S-CoreDream-9Black", size: 14)!
	}
}
