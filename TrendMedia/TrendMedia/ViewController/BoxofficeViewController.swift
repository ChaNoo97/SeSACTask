//
//  BoxofficeViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/11/02.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON
import RealmSwift

class BoxofficeViewController: UIViewController {
	
	@IBOutlet weak var boxofficeDatePicker: UIDatePicker!
	
	@IBOutlet weak var boxofficeTableView: UITableView!
	var data: [boxofficeData] = []
	
	let localRealm = try! Realm()
	var tasks: Results<BoxofficeData>!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		//삭제필요
		try! localRealm.write {
			localRealm.deleteAll()
		}
		tasks = localRealm.objects(BoxofficeData.self)
		print(tasks)
		print("realmDic\(localRealm.configuration.fileURL!)")
		boxofficeDatePicker.datePickerMode = .date
		boxofficeDatePicker.preferredDatePickerStyle = .wheels
		boxofficeDatePicker.locale = Locale(identifier: "ko-kr")
		boxofficeDatePicker.addTarget(self, action: #selector(change) , for: .valueChanged)
		
		fetchData(apiKey: APIkey.koficKey, date: "20211101")
		
		boxofficeTableView.delegate = self
		boxofficeTableView.dataSource = self
    }
	
	@objc func change(){
		//실행될때 체크 (DB에 있는지) 없으면 API call
		let dateformatter = DateFormatter()
		dateformatter.dateStyle = .short
		dateformatter.dateFormat = "yyyyMMdd"
		let date = dateformatter.string(from: boxofficeDatePicker.date)
		data.removeAll()
		fetchData(apiKey: APIkey.koficKey, date: date)
	}
    
	func fetchData(apiKey: String, date: String) {
	
		let url = Endpoint.koficURL+"key=\(apiKey)&targetDt=\(date)"
		print(url)
		AF.request(url, method: .get).validate().responseJSON { response in
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				print("JSON: \(json)")
				let list = json["boxOfficeResult"]["dailyBoxOfficeList"]
				for i in 0...9 {
					let movieName = list[i]["movieNm"].stringValue
					let openDate = list[i]["openDt"].stringValue

					//DB Add
					let task = BoxofficeData(title: movieName, openDt: openDate, uploadDate: date)

					try! self.localRealm.write {
						self.localRealm.add(task)
					}
					//Api -> boxofficeData
					let boxofficedata = boxofficeData(titleData: movieName, openDt: openDate)
					self.data.append(boxofficedata)
				}
				self.boxofficeTableView.reloadData()
			case .failure(let error):
				print(error)
			}
		}
	}
}

extension BoxofficeViewController: UITableViewDelegate,UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
		//return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: BoxofficeTableViewCell.identifier) as? BoxofficeTableViewCell else {
			return UITableViewCell()
		}
		
		let row = data[indexPath.row]
		
		cell.movieNameLabel.text = row.titleData
		cell.openDayLabel.text = row.openDt
		
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 120
	}
	
}

