//
//  MainViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
	
	@IBOutlet weak var leftButton: UIBarButtonItem!
	
	@IBOutlet weak var topView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var buttonView: UIView!
	@IBOutlet weak var firstButton: UIButton!
	@IBOutlet weak var secondButton: UIButton!
	@IBOutlet weak var thirdButton: UIButton!
	
	@IBOutlet weak var mainTableView: UITableView!
	
	let mainTvShow = tvshowList()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// navitem right button 추후 구현
		navigationItem.title = "TREND MEDIA"
		topView.backgroundColor = .systemIndigo
		titleDesign(lbl: titleLabel, text: "OH HOO!", font: .boldSystemFont(ofSize: 40))
		titleLabel.adjustsFontSizeToFitWidth = true
		titleLabel.textAlignment = .center
		titleLabel.textColor = .white
		buttonView.layer.cornerRadius = 10
		buttonDesign(btn: firstButton, systemimagename: "film", color: .green)
		buttonDesign(btn: secondButton, systemimagename: "tv", color: .orange)
		buttonDesign(btn: thirdButton, systemimagename: "book.closed", color: .blue)		
		mainTableView.delegate = self
		mainTableView.dataSource = self
	}

	@IBAction func leftButtonClicked(_ sender: Any) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true, completion: nil)
		
	}
	
	@IBAction func thirdButtonClicked(_ sender: UIButton) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "VideoCollectionViewController") as! VideoCollectionViewController
		
		navigationController?.pushViewController(vc, animated: true)
		
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return mainTvShow.tvShow.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier,for: indexPath) as? MainTableViewCell else {return UITableViewCell()}
		
		let row = mainTvShow.tvShow[indexPath.row]
		
		genreDesign(lbl: cell.genreLabel, text: row.genre, font:.systemFont(ofSize: 10))
		
		titleDesign(lbl: cell.engTitleLabel, text: row.title, font: .boldSystemFont(ofSize: 30))
		
		let url = URL(string: row.backdropImage)
		let imageURL = try?Data(contentsOf: url!)
		let image = UIImage(data: imageURL!)
		posterDesign(imv: cell.posterImageView, image: image!)
		
		rateDesign(lbl: cell.rateLabel, text:"평점", font: .systemFont(ofSize:5), backgroundColor: .orange)
		ratenumDesign(lbl: cell.rateNumLabel, text: row.rate, font: .systemFont(ofSize:5), backgroundColor: .white)
		
		titleDesign(lbl: cell.korTitleLabel, text: row.korTitle, font: .boldSystemFont(ofSize: 30))

		genreDesign(lbl: cell.dateLabel, text: row.releaseDate, font: .systemFont(ofSize: 13))
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "CastViewController") as! CastViewController
		let row = mainTvShow.tvShow[indexPath.row]
		
		vc.titleText = row.korTitle
		vc.castUrl = row.backdropImage
		
		navigationController?.pushViewController(vc, animated: true)
		
		
	}
	
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 350
	}
	
	

    
    
}
