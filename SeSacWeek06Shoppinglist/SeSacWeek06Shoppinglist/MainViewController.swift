//
//  MainViewController.swift
//  SeSacWeek06Shoppinglist
//
//  Created by Hoo's MacBookAir on 2021/11/02.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

	
	@IBOutlet weak var sortButton: UIButton!
	@IBOutlet weak var settingButton: UIButton!
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var addTextFiled: UITextField!
	@IBOutlet weak var addButton: UIButton!
	@IBOutlet weak var tableView: UITableView!
	
	let localRealm = try! Realm()
	
	var tasks: Results<UserShoppinglist>!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
       
		settingButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
		settingButton.tintColor = .lightGray
		
		print("RealmLocated:", localRealm.configuration.fileURL!)
		
		tasks = localRealm.objects(UserShoppinglist.self)
		print(tasks)
		
		sortButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
		sortButton.tintColor = .lightGray
		
    }
	
	@objc func checkButtonClicked(sender: UIButton) {
		
		//try 써줘야 한다. 파라미터 변수가 sender 이니까 sender.tag 해야함. bool 값에서 버튼 = !버튼 하면 반대값으로 바뀜
		try! localRealm.write{
			tasks[sender.tag].checkBtn = !tasks[sender.tag].checkBtn
		}
		tableView.reloadData()
	}
	
	@objc func bookmarkButtonClicked(sender: UIButton) {
		try! localRealm.write{
			tasks[sender.tag].bookmarkBtn.toggle()
		}
		tableView.reloadData()
	}
	
	@IBAction func settingButtonClicked(_ sender: UIButton) {
		let sb = UIStoryboard(name: "Main", bundle: nil)
		let vc = sb.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
		
		let nav = UINavigationController(rootViewController: vc)
		nav.modalPresentationStyle = .fullScreen
		
		present(nav, animated: true, completion: nil)
	}
	
	@IBAction func sortButtonClicked(_ sender: UIButton) {
//		print("sort")
//
//		try! self.localRealm.write {
//			tasks.sorted(byKeyPath: "checkBtn")
//		}
//		tableView.reloadData()
		
		
		let alert = UIAlertController(title: "정렬", message: "정렬기준을 선택해주세요", preferredStyle: .actionSheet)

		let checkStandard = UIAlertAction(title: "할일", style: .default) { action in
			self.tasks = self.tasks.sorted(byKeyPath: "checkBtn", ascending: false)
			self.tableView.reloadData()
		}
		let favoriteStandard = UIAlertAction(title: "즐겨찾기", style: .default) { action in
			self.tasks = self.tasks.sorted(byKeyPath: "bookmarkBtn", ascending: false)
			self.tableView.reloadData()
		}

		let titleStandard = UIAlertAction(title: "제목",  style: .default) { action in
			self.tasks = self.tasks.sorted(byKeyPath: "content", ascending: true)
			self.tableView.reloadData()
		}
		

		alert.addAction(checkStandard)
		alert.addAction(favoriteStandard)
		alert.addAction(titleStandard)

		present(alert, animated: true, completion: nil)
	}
	
	@IBAction func addButtonClicked(_ sender: UIButton) {
		if let text = addTextFiled.text {
			let task = UserShoppinglist(content: text)
			try! localRealm.write{
				localRealm.add(task)
			}
		} else {
			//alert
		}
		
		tableView.reloadData()
	}
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopinglistTableViewCell.identifier) as? ShopinglistTableViewCell else { return UITableViewCell() }
		
		//button tag 정리하기 ㅠ
		cell.checkButton.tag = indexPath.row
		cell.checkButton.addTarget(self, action: #selector(checkButtonClicked(sender:)), for: .touchUpInside)
		cell.bookmarkButton.tag = indexPath.row
		cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonClicked(sender:)), for: .touchUpInside)
		
		
		let row = tasks[indexPath.row]
	
		cell.contentLable.text = row.content
		
		if row.checkBtn == false {
			cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
		} else {
			cell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
		}
		
		if row.bookmarkBtn == false {
			cell.bookmarkButton.setImage(UIImage(systemName: "star"), for: .normal)
		} else {
			cell.bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
		}
		
		
		return cell
	}

	
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}
	
//	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//		true
//	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		let row = tasks[indexPath.row]
		
		try! localRealm.write {
			localRealm.delete(row)
			tableView.reloadData()
		}
	}
	
}
