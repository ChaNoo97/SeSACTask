//
//  MainViewController.swift
//  shopList
//
//  Created by Hoo's MacBookAir on 2021/11/05.
//

import UIKit

class MainViewController: UIViewController {
	@IBOutlet weak var mainTableView: UITableView!
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var settingButton: UIButton!
	@IBOutlet weak var sortButton: UIButton!
	
	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var contentTextField: UITextField!
	@IBOutlet weak var addButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		mainTableView.dataSource = self
		mainTableView.delegate = self
		
		MainViewController.design(titleLabel: titleLabel, settingButton: settingButton, sortButton: sortButton, contentView: contentView, contentTextField: contentTextField, addButton: addButton)
		
		// 데이터베이스 작업 이어가자
		
    }
    
	@objc func checkButtonClicked(sender: UIButton) {
		print(sender.tag,"chbtn눌림")
	}
	
	@objc func bookmarkButtonClicked(sender: UIButton) {
		print(sender.tag,"bmbtn눌림")
	}

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as? MainTableViewCell else { return UITableViewCell() }
		
		cell.checkButton.tag = indexPath.row
		cell.checkButton.addTarget(self, action: #selector(checkButtonClicked(sender:)), for: .touchUpInside)
		
		cell.bookmarkButton.tag = indexPath.row
		cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonClicked(sender:)), for: .touchUpInside)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70
	}

	
	
}

