//
//  ShoppinglistTableViewController.swift
//  Shoppinglist
//
//  Created by Hoo's MacBookAir on 2021/10/13.
//

import UIKit

class ShoppinglistTableViewController: UITableViewController {

	@IBOutlet weak var TopView: UIView!
	@IBOutlet weak var AddTextField: UITextField!
	@IBOutlet weak var AddButton: UIButton!
	@IBOutlet weak var TopLabel: UILabel!
	
//	var list: [String] = ["사이다","콜라"]
	
	var image1 = UIImage(systemName: "star")
	var image2 = UIImage(systemName: "checkmark.square")
	var image3 = UIImage(systemName: "star.fill")
	var image4 = UIImage(systemName: "checkmark.square.fill")
	
	let userDefault = UserDefaults.standard
	
	var list = [listCell]() {
		didSet {
			saveDate()
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		TopView.backgroundColor = .systemGray5
		TopView.layer.cornerRadius = 10
		
		TopLabel.text = "쇼핑"
		TopLabel.textColor = .black
		TopLabel.font = .boldSystemFont(ofSize: 20)
		
		AddTextField.placeholder = "무엇을 구매하실 건가요?"
		AddTextField.borderStyle = .none
		AddTextField.backgroundColor = .systemGray5
		
		AddButton.setTitle("추가", for: .normal)
		AddButton.layer.cornerRadius = 10
		AddButton.tintColor = .black
		AddButton.backgroundColor = .systemGray4
		
		loadDate()
    }

	
	//버튼 누를때 reloadData 해야함 진짜 진짜 중요
	@IBAction func AddButtonClicked(_ sender: UIButton) {
		
		if let text = AddTextField.text {
			let shoppinglist = listCell(product: text, checkBtn: true, bookmarBtn: true)
			list.append(shoppinglist)
		} else {
			print("error")
		}
		//나중에...분기처리 ( 아무것도 없을때 alert 띄울것 )
//		if let content = AddTextField.text {
//			list.append(content)
//			tableView.reloadData()
//		} else {
//			list.append("1")
//			tableView.reloadData()
//		}
	}
	
	func loadDate() {
		if let data = userDefault.object(forKey: "shoppinglist") as? [[String:Any]] {
			var shoppinglist = [listCell]()
			
			for datum in data {
				guard let text = datum["text"] as? String else {return}
				guard let checkbtn = datum["checkbtn"] as? Bool else {return}
				guard let bookbtn = datum["bookbtn"] as? Bool else {return}
				
				shoppinglist.append(listCell(product: text, checkBtn: checkbtn, bookmarBtn: bookbtn))
			}
			self.list = shoppinglist
		}
	}
	
	func saveDate() {
		var shoppinglist: [[String : Any]] = []
		
		for i in list {
			let data: [String:Any] = ["text": i.product,
									  "checkbtn":i.checkBtn,
									  "bookbtn":i.bookmarBtn]
			shoppinglist.append(data)
		}
		userDefault.set(shoppinglist,forKey: "shoppinglist")
		tableView.reloadData()
	}
	
	
	

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
	}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return list.count
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier:"ShoppinglistTableViewCell" , for: indexPath) as! ShoppinglistTableViewCell
		let row = list[indexPath.row]
		
		cell.backgroundColor = .systemGray5
		
		cell.ContentLabel.text = row.product
		cell.ContentLabel.textColor = .black
		cell.ContentLabel.font = .systemFont(ofSize: 20)
		
		
		//tintcolor???
		cell.CheckButton.tintColor = .black
		cell.CheckButton.setImage(image2, for: .normal)
		
		//정리하기 이미지 넣는거 제발..
		cell.BookmarkButton.setImage(image1, for: .normal)
		cell.BookmarkButton.tintColor = .black
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
    
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete{
			list.remove(at: indexPath.row)
		}
	}
}
