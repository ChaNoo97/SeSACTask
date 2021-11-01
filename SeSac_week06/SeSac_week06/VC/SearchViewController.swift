//
//  SearchViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit

class SearchViewController: UIViewController {

	@IBOutlet weak var searchTableView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.title = "검색"
		
		searchTableView.delegate = self
		searchTableView.dataSource = self
       
    }
	
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return 30
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as? SearchTableViewCell else {
			return UITableViewCell()
		}
		
		cell.titleLabel.text = "제목"
		cell.titleLabel.font = UIFont().SCDream5
		
		cell.contentLabel.text = "내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용"
		cell.contentLabel.numberOfLines = 0
		cell.contentLabel.font = UIFont().SCDream2
		
		cell.dateLabel.text = "2021. 11. 01"
		cell.dateLabel.font = UIFont().SCDream2
		
		cell.photoImageView.layer.cornerRadius = 10
		cell.photoImageView.backgroundColor = .blue
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 170
	}

	
}
