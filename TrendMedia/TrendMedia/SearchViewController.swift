//
//  SearchViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
	@IBOutlet var mainView: UIView!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var searchBar: UISearchBar!
	
	let searchTvShow = tvshowList()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		
		mainView.backgroundColor = .black
		buttonDesign(btn: backButton, systemimagename: "xmark", color: .white)
		searchBar.backgroundColor = .black
		tableView.backgroundColor = .black
    }
    
	@IBAction func backButtonclicked(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return searchTvShow.tvShow.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier,for: indexPath) as? SearchTableViewCell else {return UITableViewCell()}
		
		let row = searchTvShow.tvShow[indexPath.row]
		cell.backgroundColor = .black
		cell.titleLabel.text = row.title
		cell.titleLabel.textColor = .white
		cell.titleLabel.font = .boldSystemFont(ofSize: 15)
		cell.subTitleLabel.text = "\(row.releaseDate) +/+\(row.region)"
		cell.subTitleLabel.textColor = .white
		cell.subTitleLabel.font = .systemFont(ofSize: 10)
		cell.overviewLabel.text = row.overview
		cell.overviewLabel.numberOfLines = 0
		cell.overviewLabel.textColor = .lightGray
		cell.overviewLabel.font = .systemFont(ofSize: 12)
		
		let url = URL(string: row.backdropImage)
		let data = try? Data(contentsOf: url!)
		cell.posterImage.image = UIImage(data: data!)

		return cell 
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
}
