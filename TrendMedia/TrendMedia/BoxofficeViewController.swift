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

class BoxofficeViewController: UIViewController {

	@IBOutlet weak var boxofficeTableView: UITableView!
	var data: [boxofficeData] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		fetchData(apiKey: APIkey.koficKey, date: 20211101)
		
		boxofficeTableView.delegate = self
		boxofficeTableView.dataSource = self
    }
    
	func fetchData(apiKey: String, date: Int) {
		
		let url = Endpoint.koficURL+"key=\(apiKey)&targetDt=\(date)"
		print(url)
		AF.request(url, method: .get).validate().responseJSON { response in
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				print("JSON: \(json)")
				let list = json["boxOfficeResult"]["dailyBoxOfficeList"]
				for i in 0...9 {
					let moveName = list[i]["movieNm"].stringValue
					let openDate = list[i]["openDt"].stringValue
					
					let boxofficedata = boxofficeData(titleData: moveName, openDt: openDate)
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
