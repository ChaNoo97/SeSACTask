//
//  AsyncViewController.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/29.
//

import UIKit

class AsyncViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	
	@IBOutlet var collectionLabel: [UILabel]!
	
	let url = "https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		//1. 내일날짜 구하기
		let calendar = Calendar.current
		let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())
		print(tomorrow)
		
		//2. 이번주 월요일은? //var -> let 으로 바꾸면 왜 오류 나는지 struct class 관점에서 생각해보기
		var component = calendar.dateComponents([.weekOfYear, .yearForWeekOfYear, .weekday], from: Date())
		component.weekday = 2
		
		let mondayWeek = calendar.date(from: component)
		print(mondayWeek)
		
		for i in collectionLabel {
			i.backgroundColor = .blue
		}
		
//		collectionLabel.forEach {
//			$0.backgroundColor = .blue
//			$0.clipsToBounds = true
//			$0.layer.borderWidth = 1
//			$0.layer.borderColor = UIColor.green.cgColor
//		}
		
		collectionLabel.forEach { $0.setBorderStyle() }
		
    }
    

	@IBAction func requestButtonClicked(_ sender: UIButton) {
		
		DispatchQueue.global().async {
			if let url = URL(string: self.url), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
				
				
				DispatchQueue.main.async {
					self.imageView.image = image
				}
				
			}
		}
	}
	

}
