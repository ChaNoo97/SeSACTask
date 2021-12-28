//
//  PersonViewController.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/28.
//

import UIKit
import SnapKit

class PersonViewController: UIViewController {
	
	private var viewModel = PersonViewModel()
	
	fileprivate var tableView = UITableView()
	fileprivate var searchBar = UISearchBar()
	var list: Person?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(searchBar)
		searchBar.snp.makeConstraints {
			$0.leading.trailing.equalToSuperview()
			$0.top.equalTo(view.safeAreaLayoutGuide)
			$0.height.equalTo(44)
		}
		searchBar.delegate = self
		
		view.addSubview(tableView)
		tableView.snp.makeConstraints {
			$0.leading.trailing.equalToSuperview()
			$0.top.equalTo(searchBar.snp.bottom)
			$0.bottom.equalTo(view.safeAreaLayoutGuide)
		}
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		viewModel.person.bind { person in
			self.list = person
			self.tableView.reloadData()
		}
	}
	

	
	
}

extension PersonViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		self.viewModel.fetchPerson(quary: searchBar.text!, page: 1)
	}
	
}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRowInSection
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		let data = viewModel.cellForRowAt(at: indexPath)
		cell.textLabel?.text = "\(data.name) | \(data.knownForDepartment)"
		return cell
	}
	
	
}
