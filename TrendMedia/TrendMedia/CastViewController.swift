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
		
		let data = URL(string: castUrl!)
		let imageUrl = try?Data(contentsOf: data!)
		castImage.image = UIImage(data: imageUrl!)
		castImage.contentMode = .scaleAspectFill
		
		castTableView.rowHeight = UITableView.automaticDimension
		castTableView.estimatedRowHeight = 50
    }
	
    
}

extension CastViewController:  UITableViewDelegate,UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier, for: indexPath) as? CastTableViewCell else {
			return UITableViewCell()}
		if indexPath.row == 0 {
			cell.castLabel.text = "cadttttttttttttttttttttttttttttttttttttttseadfasdfasdfasdfsadfasdft"
			return cell
		} else {
			cell.castLabel.text = "castName"
			return cell
		}
	
		
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return UITableView.automaticDimension
		} else {
			return 70
		}
		
	}
	
}
