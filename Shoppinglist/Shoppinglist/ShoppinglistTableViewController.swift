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
	
	var list: [String] = ["사이다","콜라"]
	
	var image1 = UIImage.init(systemName: "star")
	var image2 = UIImage.init(systemName: "checkmark.square")
	var image3 = UIImage.init(systemName: "star.fill")
	var image4 = UIImage.init(systemName: "checkmark.square.fill")
	
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
		
    }

	
	//버튼 누를때 reloadData 해야함 진짜 진짜 중요
	@IBAction func AddButtonClicked(_ sender: UIButton) {
		//분기처리 ( 아무것도 없을때 alert 띄울것 )
		if let content = AddTextField.text {
			list.append(content)
			tableView.reloadData()
		} else {
			list.append("1")
			tableView.reloadData()
		}
	}
	@IBAction func CheckButtonClicked(_ sender: UIButton) {
		
		tableView.reloadData()
	}
	@IBAction func BookmarkButtonClicked(_ sender: UIButton) {
		
		tableView.reloadData()
	}
	
	
	// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
	}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return list.count
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier:"ShoppinglistTableViewCell" , for: indexPath) as! ShoppinglistTableViewCell
		cell.backgroundColor = .systemGray5
		
		cell.ContentLabel.text = list[indexPath.row]
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

    
}
