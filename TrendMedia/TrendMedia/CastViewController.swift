//
//  CastViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier, for: indexPath) as? CastTableViewCell else {
			return UITableViewCell()}
		
		cell.castLabel.text = "castName"
		
		return cell
	}
	
	
	
	@IBOutlet weak var castTableView: UITableView!
	
	let castTvShow = tvshowList()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		castTableView.delegate = self
		castTableView.dataSource = self
    }
	
    
}

