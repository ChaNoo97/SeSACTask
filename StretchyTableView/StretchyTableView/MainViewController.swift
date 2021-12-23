//
//  MainViewController.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/23.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController {
	
	var mainView = MainView()
	
	override func loadView() {
		self.view = mainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		mainView.mainTableView.dataSource = self
		mainView.mainTableView.delegate = self
		
		mainView.mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
	}
	
	override func configure() {
		super.configure()
	}
	
	override func setupConstraints() {
		
	}
	
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 100
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = mainView.mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier) as! MainTableViewCell
		cell.layer.zPosition
		cell.label.text = "\(indexPath.row)"
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//		print(mainView.headerImageView.bounds.height)
		return 50
	}
	
}
