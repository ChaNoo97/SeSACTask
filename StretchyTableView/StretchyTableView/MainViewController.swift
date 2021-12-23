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
		
		mainView.mainTableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
		
	}
	
	override func configure() {
		super.configure()
	}
	
	override func setupConstraints() {
		super.setupConstraints()
	}
	
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		<#code#>
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		<#code#>
	}
	
	
}
