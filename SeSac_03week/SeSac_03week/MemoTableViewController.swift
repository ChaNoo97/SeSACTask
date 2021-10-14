//
//  MemoTableViewController.swift
//  SeSac_03week
//
//  Created by Hoo's MacBookAir on 2021/10/12.
//

import UIKit

class MemoTableViewController: UITableViewController {
	
	var list = [Memo]() {
		didSet {
			saveData()
		}
	}
	
//	var list: [Memo] = [] {
//		didSet {
//			tableView.reloadData()
//		}
//	}
	
	@IBOutlet weak var categorySegmentedControl: UISegmentedControl!
	@IBOutlet weak var memoTextView: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		//자동 높이계산
//		UITableView.automaticDimension
        loadData()
    }
	
	@IBAction func saveButtonClicked(_ sender: UIButton) {
		//배열에 텍스트뷰의 텍스트 값 추가
		if let text = memoTextView.text {
			
			let segmentIndex = categorySegmentedControl.selectedSegmentIndex
			
			let segmentCategory = Category(rawValue: segmentIndex) ?? .others
			
			let memo = Memo(content: text, category: segmentCategory)
			
			
			list.append(memo)
//			tableView.reloadData()

		} else {
			print("ERROR")
		}
	}
	
	func loadData() {
		let userDefaults = UserDefaults.standard
		if let data = userDefaults.object(forKey: "memoList") as? [[String:Any]] {
			var memo = [Memo]()
			for datum in data {
				guard let category = datum["category"] as? Int else { return }
				guard let content = datum["content"] as? String else { return }
				
				let enumCategory = Category(rawValue: category) ?? .others
				memo.append(Memo(content: content, category: enumCategory))
			}
			self.list = memo
		}
	}
	
	func saveData() {
		var memo: [[String: Any]] = []
		
		for i in list {
			let data: [String:Any] = [
				"category": i.category.rawValue,
				"content": i.content
			]
			memo.append(data)
		}
		let userDefaults = UserDefaults.standard
		userDefaults.set(memo, forKey: "memoList")
		
		tableView.reloadData()
	}
	//옵션: 섹션의 수: numberOfSections = default : 1
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	//옵션: 섹션 타이틀: titleForHeaderInsection
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "섹션 타이틀"
	}
	
	//테이블뷰 필수 메서드
	//1. (필수)셀의 개수 : numberOfRowsInSection
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		if section == 0 {
//			return 2
//		} else {
//			return 4
//		}
		return section == 0 ? 2 : list.count
	}
	//2. (필수)셀의 디자인 및 데이터 처리 : cellForRowAt
	// 재사용 메커니즘, 옵셔널 체이닝, 옵셔널 바인딩
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		print(#function) //재사용 메커니즘
		
		//Early Exit
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell") else {
			return UITableViewCell()
		}
		
//		if cell!.textLabel != nil{
//			cell!.textLabel!.text = "asdklf"
//		}
		
		if indexPath.section == 0{
			cell.textLabel?.text = "첫번째 섹션입니다. -\(indexPath)"
			cell.textLabel?.textColor = .brown
			cell.textLabel?.font = .boldSystemFont(ofSize: 15)
			cell.imageView?.image = nil
			cell.detailTextLabel?.text = nil
		} else {
			
			let row = list[indexPath.row]
//			if indexPath.row == 0{
//				cell?.textLabel?.text = list[0]
//			} else if indexPath.row == 1 {
//				cell?.textLabel?.text = list[1]
//			} else if indexPath.row == 2 {
//				cell?.textLabel?.text = list[2]
//			} else if indexPath.row == 3 {
//				cell?.textLabel?.text = list[3]
//			} else {
//				cell?.textLabel?.text = "데이터 없음"
//			}
			cell.textLabel?.text = row.content
			cell.detailTextLabel?.text = row.category.description
			cell.textLabel?.textColor = .blue
			cell.textLabel?.font = .italicSystemFont(ofSize: 13)
			
			switch row.category {
			case .business:
				cell.imageView?.image = UIImage(systemName: "building.2")
			case .personal:
				cell.imageView?.image = UIImage(systemName: "star")
			case .others:
				cell.imageView?.image = UIImage(systemName: "star.fill")
			}
			cell.imageView?.tintColor = .red
		}
		return cell
	}

	//(옵션) 셀을 클릭했을 때 기능
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("셀 선택")
	}
	
	//3. (옵션 이지만 거의 필수)셀의 높이 : heightForRowAt
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//		return indexPath.section == 0 ? 44 : 80 //기본셀의 높이는 44
		return indexPath.row == 0 ? 44 : 80
	}
	
	//(옵션) 셀 스와이프 on/off
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return indexPath.section == 0 ? false : true
	}
	
	//(옵션) 셀 편집 상태 edtingStyle
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		if indexPath.section == 1{
			if editingStyle == .delete{
				list.remove(at: indexPath.row)
//				tableView.reloadData()
			}
		}
	}
}
