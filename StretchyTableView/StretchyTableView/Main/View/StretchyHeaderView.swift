//
//  StretchyHeaderView.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/30.
//

import UIKit
import SnapKit

class StretchyHeaderView: UIView {
	let imageView = UIView()
	let descriptionView = UIView()
	let moreButton = UIButton()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		configure()
		setConstraints()
	}
	
	func configure() {
		self.backgroundColor = .white
		imageView.backgroundColor = .blue
		descriptionView.backgroundColor = .red
		moreButton.backgroundColor = .black
		
	}
	
	func setConstraints() {
		[imageView, descriptionView, moreButton].forEach {
			addSubview($0)
		}
		
		imageView.snp.makeConstraints {
			$0.top.leading.trailing.equalTo(self)
			$0.height.equalTo(300)
		}
		
		descriptionView.snp.makeConstraints {
			$0.top.equalTo(imageView.snp.bottom).inset(50)
			$0.leading.trailing.equalTo(self).inset(20)
			$0.height.equalTo(150)
		}
		
		moreButton.snp.makeConstraints {
			$0.centerX.equalTo(descriptionView)
			$0.width.equalTo(50)
			$0.height.equalTo(20)
			$0.bottom.equalTo(descriptionView.snp.bottom).inset(50)
		}
	}
}
