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
    }
	
    
}

extension CastViewController:  UITableViewDelegate,UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier, for: indexPath) as? CastTableViewCell else {
			return UITableViewCell()}
		
		cell.castLabel.text = "castName"
		
		return cell
	}
	
}
