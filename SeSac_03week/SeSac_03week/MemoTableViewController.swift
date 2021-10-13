//
//  MemoTableViewController.swift
//  SeSac_03week
//
//  Created by Hoo's MacBookAir on 2021/10/12.
//

import UIKit

class MemoTableViewController: UITableViewController {
	
	var list: [String] = ["장보기","메모메모","영화보러가기","WWDC 시청하기"] {
		didSet {
			tableView.reloadData()
		}
	}
	
	@IBOutlet weak var memoTextView: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        
    }
	
	@IBAction func saveButtonClicked(_ sender: UIButton) {
		//배열에 텍스트뷰의 텍스트 값 추가
		if let text = memoTextView.text {
			list.append(text)
//			tableView.reloadData()
			print(list)
		} else {
			print("")
		}
		
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
			
			cell.textLabel?.text = "셀입니다. -\(indexPath)"
			cell.textLabel?.textColor = .brown
			cell.textLabel?.font = .boldSystemFont(ofSize: 15)
		} else {
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
			cell.textLabel?.text = list[indexPath.row]
			cell.textLabel?.textColor = .blue
			cell.textLabel?.font = .italicSystemFont(ofSize: 15)
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
