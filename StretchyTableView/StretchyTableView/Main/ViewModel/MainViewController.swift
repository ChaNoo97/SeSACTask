//
//  MainViewController.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/23.
//

import UIKit
import SnapKit

//MARK: ViewModel
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
	
	func descriptionViewSetup(view: UIView) {
		view.addSubview(mainView.descriptionView)
		mainView.descriptionView.backgroundColor = .black
		mainView.descriptionView.snp.makeConstraints {
			$0.leading.equalTo(view.snp.leading).inset(20)
			$0.trailing.equalTo(view.snp.trailing).inset(20)
			$0.top.equalTo(view.snp.bottom).offset(-50)
			$0.height.equalTo(150)
		}
	}
	
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 100
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = mainView.mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier) as! MainTableViewCell
		cell.label.text = "\(indexPath.row)"
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = mainView.headerImageView
		// mvvm 관점에서 이게 맞을까?
		descriptionViewSetup(view: headerView)
		return headerView
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 300
	}
	
}
