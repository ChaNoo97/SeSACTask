//
//  MainView.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/23.
//

import UIKit
import SnapKit

class MainView: UIView {
	let mainTableView = UITableView()
	let headerImageView = UIImageView()
	let descriptionView = UIView()
	let bottonView = UIView()
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
		descriptionView.backgroundColor = .white
		headerImageView.backgroundColor = .red
		bottonView.backgroundColor = .green
		refreshButton.backgroundColor = .cyan
		shareButton.backgroundColor = .cyan
	}
	
	func setConstraints() {
		addSubview(mainTableView)
		[headerImageView, descriptionView].forEach {
			mainTableView.addSubview($0)
		}
		
		addSubview(bottonView)
		[refreshButton, shareButton].forEach {
			bottonView.addSubview($0)
		}
		
		mainTableView.snp.makeConstraints {
			$0.height.equalTo(self).multipliedBy(0.8)
			$0.top.trailing.leading.equalTo(self.safeAreaLayoutGuide)
		}
		
		descriptionView.snp.makeConstraints {
			$0.top.equalTo(headerImageView.snp.bottom).offset(-50)
			$0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(30)
			$0.height.equalTo(150)
		}
		
		headerImageView.snp.makeConstraints {
			$0.top.equalTo(mainTableView.snp.top)
			$0.leading.trailing.equalTo(self.safeAreaLayoutGuide)
			$0.height.equalTo(mainTableView).multipliedBy(0.3)
		}
		
		bottonView.snp.makeConstraints {
			$0.top.equalTo(mainTableView.snp.bottom)
			$0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
		}
		
		refreshButton.snp.makeConstraints {
			$0.leading.equalTo(bottonView.snp.leading).inset(10)
			$0.top.equalTo(bottonView.snp.top).inset(10)
			$0.bottom.equalTo(bottonView.snp.bottom).inset(10)
			$0.width.equalTo(refreshButton.snp.height)
		}
		
		shareButton.snp.makeConstraints {
			$0.trailing.equalTo(bottonView.snp.trailing).inset(10)
			$0.top.equalTo(bottonView.snp.top).inset(10)
			$0.bottom.equalTo(bottonView.snp.bottom).inset(10)
			$0.leading.equalTo(refreshButton.snp.trailing).offset(10)
		}
	}
	
}
