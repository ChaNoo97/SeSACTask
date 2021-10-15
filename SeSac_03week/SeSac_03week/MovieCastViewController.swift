//
//  MovieCastViewController.swift
//  SeSac_03week
//
//  Created by Hoo's MacBookAir on 2021/10/15.
//

import UIKit

class MovieCastViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var castTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//코드로 연결하는 방법
		castTableView.delegate = self
		castTableView.dataSource = self
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "CastCell") else {return UITableViewCell()}
		
		cell.textLabel?.text = "CAST\(indexPath.row)"
		
		return cell
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
    

   
}
