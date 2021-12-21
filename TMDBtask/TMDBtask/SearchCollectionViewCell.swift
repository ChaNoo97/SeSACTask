//
//  SearchCollectionViewCell.swift
//  TMDBtask
//
//  Created by Hoo's MacBookPro on 2021/12/22.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
	var posterImage: UIImageView!
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupCell()
	}
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupCell()
	}
	
	func setupCell() {
		posterImage = UIImageView()
		contentView.addSubview(posterImage)
		posterImage.snp.makeConstraints {
			$0.edges.equalTo(contentView)
		}
	}

}
