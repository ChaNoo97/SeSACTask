//
//  UICollectionViewCellExtension.swift
//  TMDBtask
//
//  Created by Hoo's MacBookPro on 2021/12/22.
//

import UIKit

protocol ReusableView {
	static var reusIdentifier: String { get }
}

extension UICollectionViewCell: ReusableView {
	static var reusIdentifier: String {
		return String(describing: self)
	}
}
