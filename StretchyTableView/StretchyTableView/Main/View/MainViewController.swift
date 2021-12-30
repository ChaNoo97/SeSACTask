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
	var headerView = StretchyHeaderView()
	var toggle = false
	var apiService = ApiService()
	
	
	override func loadView() {
		self.view = mainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		mainView.mainTableView.dataSource = self
		mainView.mainTableView.delegate = self
		mainView.mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
		headerView.moreButton.addTarget(self, action: #selector(moreButtonClicked), for: .touchUpInside)
	}
	
	override func configure() {
		super.configure()
	}
	
	override func setupConstraints() {
		
	}
	
	@objc func moreButtonClicked() {
		print(#function)
		toggle.toggle()
		print(toggle)
		if toggle {
			headerView.descriptionView.snp.updateConstraints {
				$0.height.equalTo(300)
			}
		} else {
			headerView.descriptionView.snp.updateConstraints {
				$0.height.equalTo(150)
			}
		}
		mainView.mainTableView.reloadData()
	}
	
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = mainView.mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier) as! MainTableViewCell
		cell.label.text = "\(indexPath.row)"
		cell.backgroundColor = .lightGray
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return headerView
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 300
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if toggle {
			return 550
		} else {
			return 400
		}
	}
	


	
}
