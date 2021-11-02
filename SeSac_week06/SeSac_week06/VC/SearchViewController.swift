//
//  SearchViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit
import RealmSwift

class SearchViewController: UIViewController {

	@IBOutlet weak var searchTableView: UITableView!
	
	let localRealm = try! Realm()
	
	var tasks: Results<UserDiary>!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.title = "검색"
		
		searchTableView.delegate = self
		searchTableView.dataSource = self
       
		tasks = localRealm.objects(UserDiary.self)
		print(tasks)
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tasks = localRealm.objects(UserDiary.self)
		searchTableView.reloadData()
	}
	
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return tasks.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as? SearchTableViewCell else {
			return UITableViewCell()
		}
		
		let row = tasks[indexPath.row]
		
		cell.titleLabel.text = row.diaryTitle
		cell.titleLabel.font = UIFont().SCDream5
		
		cell.contentLabel.text = row.diaryContent
		cell.contentLabel.numberOfLines = 0
		cell.contentLabel.font = UIFont().SCDream2
		
		cell.dateLabel.text = "\(row.writeDate)"
		cell.dateLabel.font = UIFont().SCDream2
		
		cell.photoImageView.layer.cornerRadius = 10
		cell.photoImageView.backgroundColor = .blue
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 170
	}

	
}
