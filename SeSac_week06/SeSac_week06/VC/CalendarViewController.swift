//
//  CalendarViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController {

	@IBOutlet weak var allCountLable: UILabel!
	
	@IBOutlet weak var calendarView: FSCalendar!
	
	let localRealm = try! Realm()
	
	var tasks: Results<UserDiary>!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		calendarView.delegate = self
		calendarView.dataSource = self
		
		tasks = localRealm.objects(UserDiary.self)
		
		let allCount = getAllDiaryCountFromUserDiary()
		allCountLable.text = "총 \(allCount)개를 썼다"
		
		let recent = localRealm.objects(UserDiary.self).sorted(byKeyPath: "writeDate",ascending: false).first?.diaryTitle
		print("recent: \(recent)")
		let photo = localRealm.objects(UserDiary.self).filter("diaryContent != nil").count
		print("recent: \(photo)")
		let favorite = localRealm.objects(UserDiary.self).filter("favorite = false")
		print("recent: \(favorite)")
		
		//String -> ' ' , AND OR (공식문서에 있음)
		// 검색할때는 contain 이 맞다. 필터는 일기를 포함한게 아니라 일기에 만 나옴
		let search = localRealm.objects(UserDiary.self).filter("diaryTitle CONTAINS[c] '일기' OR diaryContent CONTAINS[c] 'd'")
		print("recent: \(search)")
    }
    


}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
	
//	func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//		return "title"
//	}
//	func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//		return "subtitle"
//	}
//	func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//		return UIImage(systemName: "star")
//	}
	
	//Date: 시분초 까지 동일해야 같은거로 인식
	//1. 영국 표준시 기준으로 표기: 2021-11-27 15:00:00 -> 11/28
	//2. 데이트 포메터
	func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
		
//		let format = DateFormatter()
//		format.dateFormat = "yyyyMMdd"
//		let test = "20211103"
//
//		if format.date(from: test ) == date {
//			return 3
//		} else {
//			return 1
//		}
		
		//11/2 3개의 일기라면 3개를, 없다면 X 1개면 1개를
		return tasks.filter("writeDate == %@", date).count
	}
	
}
