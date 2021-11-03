//
//  CastViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import UIKit
import Kingfisher

class CastViewController: UIViewController {
	
	var posterUrl: URL?
	var titleText: String?
	var movieId: Int?
	
	@IBOutlet weak var moviePosterImage: UIImageView!
	
	@IBOutlet weak var castTableView: UITableView!
	
	
	let castTvShow = tvshowList()
	var chevronButtonStatus: Bool = true
	
	var castData: [CastData] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		castTableView.delegate = self
		castTableView.dataSource = self
		
		title = titleText ?? "타이틀"

		moviePosterImage.kf.setImage(with: posterUrl!)
		moviePosterImage.contentMode = .scaleAspectFill
		
		castTableView.rowHeight = UITableView.automaticDimension
		castTableView.estimatedRowHeight = 50
		
		fetchData()
		
    }
	
	func fetchData() {
		CastInfo.infoShared.fetchCastData(movieid: movieId!, apikey: APIkey.TMDB_KEY) { json in
			
			let cast = json["cast"]
			
			for i in 0...cast.count-1 {
				let name = cast[i]["name"].stringValue
				let profilePath = cast[i]["profile_path"].stringValue
				let character = cast[i]["character"].stringValue
				
				let data = CastData(name: name, character: character, profile_path: profilePath)
				self.castData.append(data)
			}
			self.castTableView.reloadData()
		}
	}
		
}

extension CastViewController:  UITableViewDelegate,UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 {
			return "Cast"
		} else {
			return "Crew"
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		if section == 0 {
//			return 1
//		} else {
//			return 10
//		}
		if section == 0 {
			return castData.count
		} else {
			return 0
		}
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
//		let tvshow = castTvShow.tvShow[indexPath.row]
		
//		if indexPath.section == 0 {
//			guard let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath) as? SummaryTableViewCell else{return UITableViewCell()}
//			cell.summaryLabel.text = "asdfasdfasfafa"//tvshow.overview
//			cell.addButton.setImage(UIImage(systemName: "star"), for: .normal)
//			if chevronButtonStatus == true { // up
//				cell.summaryLabel.numberOfLines = 1
//				tableView.reloadData()
//
//			} else { //down
//				cell.summaryLabel.numberOfLines = 0
//				tableView.reloadData()
//
//			}
//			return cell
//		} else {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier, for: indexPath) as? CastTableViewCell else {
			return UITableViewCell() }
		
		let row = castData[indexPath.row]
		
		if row.profile_path == "" {
			cell.castPotoImage.image = UIImage(systemName: "star")
		} else {
			if let url = URL(string: "https://image.tmdb.org/t/p/original\(row.profile_path)") {
				cell.castPotoImage.kf.setImage(with: url)
			}
		}
		castNameDesign(lbl: cell.castNameLabel, text: row.name)
		castCharacterDesign(lbl: cell.castCharacterLabel, text: row.character)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//		if indexPath.section == 0{
//			return UITableView.automaticDimension
//		} else {
//			return 70
//		}
		return 136
		
	}
	
}
