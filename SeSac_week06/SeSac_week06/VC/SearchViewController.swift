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
	
       
		tasks = localRealm.objects(UserDiary.self)//.filter("favorite == true")
		print(tasks)
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tasks = localRealm.objects(UserDiary.self)
		searchTableView.reloadData()
	}
	
	//도큐먼트 폴더 경로 -> 이미지 찾기 -> UIImage -> UIImageView
	func loadImageFromDocumentDirectory(imageName: String) -> UIImage? {
		let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
		let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
		let path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
		
		if let directoryPath = path.first {
			let imageURL = URL(fileURLWithPath: directoryPath).appendingPathComponent(imageName)
			return UIImage(contentsOfFile: imageURL.path)
		}
		
		return nil
	}
	
	func deleteImageFromDocumentDictory(imageName: String) {
			
		//1. 이미지 저장할 경로 설정: 도큐먼트 폴더(.documentDirectory), FileManager
		//Desktop/jack/ios/folder
		guard let documentDirctory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
			
		//2. 이미지 파일 이름 & 최종 경로 설정
		//Desktop/jack/ios/folder/222.png
		let imageURL = documentDirctory.appendingPathComponent(imageName)
			
		//4. 이미지 저장 : 동일한 경로에 이미지를 저장하게 될 경우, 덮어쓰기
		//4-1. 이미지 경로 여부 확인
		if FileManager.default.fileExists(atPath: imageURL.path) {
			
			//4-2 기존경로에 있던 이미지 삭제
			do {
				try FileManager.default.removeItem(at: imageURL)
				print("이미지 삭제 완료")
			} catch {
				print("이미지를 삭제하지 못했습니다.")
			}
		}
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
		cell.configureCell(row: row)
		
//		cell.titleLabel.text = row.diaryTitle
//		cell.titleLabel.font = UIFont().SCDream5
//
//		cell.contentLabel.text = row.diaryContent
//		cell.contentLabel.numberOfLines = 0
//		cell.contentLabel.font = UIFont().SCDream2
		
		let format = DateFormatter()
		format.dateFormat = "yyyy년 MM월 dd일"
//		let value = format.date(from: row.writeDate)
		let value = format.string(from: row.writeDate)
		cell.dateLabel.text = value
		cell.dateLabel.font = UIFont().SCDream2
		
		cell.photoImageView.image = loadImageFromDocumentDirectory(imageName: "\(row._id).jpg")
		cell.photoImageView.layer.cornerRadius = 10
		cell.photoImageView.backgroundColor = .blue
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 170
	}
	
	//본래는 화면전환 + 값 전달 후 새로운 화면에서 수정
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let taskToUpdate = tasks[indexPath.row]
		
		//1. 수정 - 레코드에 대한 값 수정
		try! localRealm.write {
			taskToUpdate.diaryTitle = "새롭게 수정해 봅니다"
			taskToUpdate.diaryContent = "블라 블라 블ㄹ ㅏ블라 블라 주식 대박나라"
			tableView.reloadData()
		}
		
//		//2. 일괄수정
//		try! localRealm.write {
//			tasks.setValue(Date(), forKey: "writeDate")
//			tasks.setValue("새롭게 일기 쓰기", forKey: "diaryTitle")
//			tableView.reloadData()
//		}
		
//		//3. 수정: pk 기준으로 수정할때 사용 (권장x)
//		try! localRealm.write {
//			let update = UserDiary(value: ["_id" : taskToUpdate._id, "diaryTitle": "얘만 바꾸고 싶어"])
//			localRealm.add(update, update: .modified)
//			tableView.reloadData()
//		}
		
//		//4.
//		try! localRealm.write {
//		localRealm.create(UserDiary.self, value: ["_id" : taskToUpdate._id, "diaryTitle": "얘만 바꿀랭"], update: .modified)
//			tableView.reloadData()
//		}
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		true
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		let row = tasks[indexPath.row]
		try! localRealm.write{
			deleteImageFromDocumentDictory(imageName: "\(row._id).jpg")
			localRealm.delete(row)
			tableView.reloadData()
		}
	}

	
}
