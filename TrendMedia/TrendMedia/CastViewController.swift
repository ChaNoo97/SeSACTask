//
//  CastViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import UIKit
import Kingfisher

class CastViewController: UIViewController {
	
	var castUrl: URL?
	var titleText: String? 
	
	
	
	@IBOutlet weak var castTableView: UITableView!
	
	@IBOutlet weak var castImage: UIImageView!
	
	let castTvShow = tvshowList()
	var chevronButtonStatus: Bool = true
	
    override func viewDidLoad() {
        super.viewDidLoad()
		castTableView.delegate = self
		castTableView.dataSource = self
		
		title = titleText ?? "타이틀"
		
		castImage.kf.setImage(with: castUrl!)
		castImage.contentMode = .scaleAspectFill
		
		castTableView.rowHeight = UITableView.automaticDimension
		castTableView.estimatedRowHeight = 50
		
		
    }
	
	@IBAction func chevronButtonClicked(_ sender: UIButton) {
		if chevronButtonStatus == true {
			chevronButtonStatus = false
		} else {
			chevronButtonStatus = true
		}
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
		
		let tvshow = castTvShow.tvShow[indexPath.row]
		
		if indexPath.section == 0 {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath) as? SummaryTableViewCell else{return UITableViewCell()}
			cell.summaryLabel.text = tvshow.overview
			cell.addButton.setImage(UIImage(systemName: "star"), for: .normal)
			if chevronButtonStatus == true { // up
				cell.summaryLabel.numberOfLines = 1
				tableView.reloadData()
			
			} else { //down
				cell.summaryLabel.numberOfLines = 0
				tableView.reloadData()
				
			}
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
