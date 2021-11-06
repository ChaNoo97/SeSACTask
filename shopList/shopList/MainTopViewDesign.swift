//
//  MainTopViewDesign.swift
//  shopList
//
//  Created by Hoo's MacBookAir on 2021/11/06.
//

import Foundation
import UIKit

extension UIViewController {
	static func design(titleLabel: UILabel, settingButton: UIButton, sortButton: UIButton, contentView: UIView, contentTextField: UITextField, addButton: UIButton ) {
	titleLabel.text = "즐쇼"
	titleLabel.textAlignment = .center
	titleLabel.textColor = .black
	
	settingButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
	settingButton.tintColor = .lightGray
	
	sortButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
	sortButton.tintColor = .lightGray
	
	contentView.backgroundColor = .systemGray4
	contentView.layer.cornerRadius = 5
	contentView.layer.borderWidth = 0
	
	contentTextField.backgroundColor = .systemGray4
	contentTextField.attributedPlaceholder = NSAttributedString(string: "입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
	contentTextField.borderStyle = .none
	
	addButton.backgroundColor = .systemGray4
	addButton.layer.cornerRadius = 5
	addButton.layer.borderWidth = 1
	addButton.layer.borderColor = UIColor.white.cgColor
	addButton.setTitle("추가하기", for: .normal)
	addButton.tintColor = .white
	}
}
