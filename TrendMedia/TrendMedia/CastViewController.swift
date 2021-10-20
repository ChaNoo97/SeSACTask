//
//  CastViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import UIKit

class CastViewController: UIViewController {
	
	var castUrl: String?
	var titleText: String? 
	
	
	
	@IBOutlet weak var castTableView: UITableView!
	
	@IBOutlet weak var castImage: UIImageView!
	
	let castTvShow = tvshowList()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		castTableView.delegate = self
		castTableView.dataSource = self
		
		title = titleText ?? "타이틀"
		
		let data = URL(string: castUrl! )
		let imageUrl = try?Data(contentsOf: data!)
		castImage.image = UIImage(data: imageUrl!)
		castImage.contentMode = .scaleAspectFill
		
		castTableView.rowHeight = UITableView.automaticDimension
		castTableView.estimatedRowHeight = 50
    }
	
    
}

extension CastViewController:  UITableViewDelegate,UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return 1
		} else {
			return 10
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		
		if indexPath.section == 0 {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath) as? SummaryTableViewCell else{return UITableViewCell()}
			cell.summaryLabel.text = "가나다라마바사아자카차내가그린그림은 기린그림이다. 간장공장공장장 구누두루무부수우주쿠추고노도로모보소오조코초기니디리미비시이지키치"
			cell.summaryLabel.numberOfLines = 0
			
			cell.addButton.setImage(UIImage(systemName: "star"), for: .normal)
			
			return cell
		} else {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier, for: indexPath) as? CastTableViewCell else {
				return UITableViewCell()}
			
			cell.castLabel.text = "이 병 헌"
			
			
			return cell
		}
		
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section == 0{
			return UITableView.automaticDimension
		} else {
			return 70
		}
		
	}
	
}
