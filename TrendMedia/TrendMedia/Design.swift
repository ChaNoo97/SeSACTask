//
//  Design.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import Foundation
import UIKit
extension UIViewController {
	
	func buttonDesign(btn:UIButton,systemimagename name: String, color: UIColor){
		let config = UIImage.SymbolConfiguration(pointSize: 50)
		let image = UIImage(systemName: name)!.withConfiguration(config)
		btn.setImage(image, for: .normal)
		btn.tintColor = color
	}
	
	func titleDesign(lbl:UILabel,text:String,font: UIFont){
		lbl.text = text
		lbl.textColor = .black
		lbl.textAlignment = .left
		lbl.font = font
		lbl.sizeToFit()
		lbl.adjustsFontSizeToFitWidth = true
	}
	
	func posterDesign(imv:UIImageView,image:UIImage){
		imv.image = image
		imv.contentMode = .scaleAspectFill
		imv.layer.cornerRadius = 10
	}
	
	func genreDesign(lbl:UILabel,text:String,font:UIFont){
		lbl.text = text
		lbl.adjustsFontSizeToFitWidth = true
		lbl.textColor = .lightGray
		lbl.textAlignment = .left
		lbl.font = font
	}
	
	func rateDesign(lbl:UILabel,text:String,font:UIFont,backgroundColor color:UIColor){
		lbl.text = text
		lbl.backgroundColor = color
		lbl.textAlignment = .center
	}
	
	func ratenumDesign(lbl:UILabel,text:Double,font:UIFont,backgroundColor color:UIColor){
		lbl.text = "\(text)"
		lbl.backgroundColor = color
		lbl.textAlignment = .center
	}
	
}
