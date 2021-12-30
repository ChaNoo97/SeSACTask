//
//  MainView.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/23.
//

import UIKit
import SnapKit

//MARK: View
class MainView: UIView {
	let mainTableView = UITableView()
	let bottomView = UIView()
	let refreshButton = UIButton()
	let shareButton = UIButton()
	
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
		mainTableView.backgroundColor = .white
		bottomView.backgroundColor = .green
		refreshButton.backgroundColor = .cyan
		shareButton.backgroundColor = .cyan
	}
	
	func setConstraints() {
		addSubview(mainTableView)
		
		addSubview(bottomView)
		[refreshButton, shareButton].forEach {
			bottomView.addSubview($0)
		}
		
		mainTableView.snp.makeConstraints {
			$0.height.equalTo(self).multipliedBy(0.8)
			$0.top.trailing.leading.equalTo(self.safeAreaLayoutGuide)
		}
		
		bottomView.snp.makeConstraints {
			$0.top.equalTo(mainTableView.snp.bottom)
			$0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
		}
		
		refreshButton.snp.makeConstraints {
			$0.leading.equalTo(bottomView.snp.leading).inset(10)
			$0.top.equalTo(bottomView.snp.top).inset(10)
			$0.bottom.equalTo(bottomView.snp.bottom).inset(10)
			$0.width.equalTo(refreshButton.snp.height)
		}
		
		shareButton.snp.makeConstraints {
			$0.trailing.equalTo(bottomView.snp.trailing).inset(10)
			$0.top.equalTo(bottomView.snp.top).inset(10)
			$0.bottom.equalTo(bottomView.snp.bottom).inset(10)
			$0.leading.equalTo(refreshButton.snp.trailing).offset(10)
		}
	}
	
}
