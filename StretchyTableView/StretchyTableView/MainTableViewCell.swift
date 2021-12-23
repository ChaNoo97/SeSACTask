//
//  MainTableViewCell.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/23.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
	let label = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: reuseIdentifier)
		
		setConstraints()
		
	}
	
	func setConstraints() {
		contentView.addSubview(label)
		
		label.snp.makeConstraints {
			$0.edges.equalTo(contentView).inset(10)
		}
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("error")
	}
}
