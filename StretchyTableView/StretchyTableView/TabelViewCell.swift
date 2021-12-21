//
//  TabelViewCell.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/21.
//

import UIKit
import SnapKit

class StretchyTabelViewCell: UITableViewCell {
	
	let personImage: UIImageView = {
		let personImage = UIImageView()
		return personImage
	}()
	
	let personName: UILabel = {
		let label = UILabel()
		return label
	}()
	
	let personAge: UILabel = {
		let label = UILabel()
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		addContentView()
		autoLayout()
		
	}
	
	func addContentView() {
		[personImage, personAge, personName].forEach {
			contentView.addSubview($0)
		}
	}
	
	func autoLayout() {
		personImage.snp.makeConstraints {
			$0.leading.top.bottom.equalTo(contentView).inset(10)
			$0.width.height.equalTo(44)
		}
		
		personName.snp.makeConstraints {
			$0.top.trailing.equalTo(contentView).inset(10)
			$0.leading.equalTo(personImage.snp.trailing).offset(10)
			$0.height.equalTo(22)
		}
		
		personAge.snp.makeConstraints {
			$0.bottom.trailing.equalTo(contentView).inset(10)
			$0.leading.equalTo(personName.snp.leading)
			$0.height.equalTo(22)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("error")
	}
}
