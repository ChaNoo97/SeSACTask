//
//  MainViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITableViewDataSourcePrefetching {
	
	@IBOutlet weak var findCinemaButton: UIBarButtonItem!
	@IBOutlet weak var boxofficeButton: UIBarButtonItem!
	@IBOutlet weak var rightButton: UIBarButtonItem!
	
	@IBOutlet weak var topView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var buttonView: UIView!
	@IBOutlet weak var firstButton: UIButton!
	@IBOutlet weak var secondButton: UIButton!
	@IBOutlet weak var thirdButton: UIButton!
	
	@IBOutlet weak var mainTableView: UITableView!
	

	let mainTvShow = tvshowList()
	
	var mainMovieDate: [MovieDate] = []
	var startPage = 1
	var totalCount = 30
	
	var urlData: [String] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchData()
		// navitem right button 추후 구현
		navigationItem.backButtonTitle = ""
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
		mainTableView.prefetchDataSource = self
	}
	
	func fetchData() {
		TMDBManager.shared.fetchTrendData(apikey: APIkey.TMDB_KEY) { json in
			let result = json["results"]
			for i in 0...result.count-1 {
				let id = result[i]["id"].intValue
				let mediaType = result[i]["media_type"].stringValue
				let backdropPath = result[i]["backdrop_path"].stringValue.replacingOccurrences(of: "", with: "" )
				let voteAverage = result[i]["vote_average"].doubleValue
				let title = result[i]["title"].stringValue
				let releaseDate = result[i]["release_date"].stringValue
				
				let data = MovieDate(
					id: id,
					media_type: mediaType,
					backdrop_path: backdropPath,
					vote_average: voteAverage,
					title: title,
					release_date: releaseDate
				)
				self.mainMovieDate.append(data)
			}
			self.mainTableView.reloadData()
		}
	}
	@IBAction func boxofficeButtomClicked(_ sender: UIButton) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "BoxofficeViewController") as! BoxofficeViewController
		navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func findCinemaButtonClicked(_ sender: UIBarButtonItem) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "FindCinemaViewController") as! FindCinemaViewController
		navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func rightButtonClicked(_ sender: Any) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true, completion: nil)
		
	}
	
	@IBAction func thirdButtonClicked(_ sender: UIButton) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "VideoCollectionViewController") as! VideoCollectionViewController
		
		navigationController?.pushViewController(vc, animated: true)
		
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return mainMovieDate.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier,for: indexPath) as? MainTableViewCell else {return UITableViewCell()}
		
		let row = mainMovieDate[indexPath.row]
		
		if let url = URL(string: "https://image.tmdb.org/t/p/original\(row.backdrop_path)") {
			cell.posterImageView.kf.setImage(with: url)
		
		} else {
			cell.posterImageView.image = UIImage(systemName: "star")
		}
		
		cell.linkButton.setImage(UIImage(systemName: "link.circle.fill"), for: .normal)
		cell.linkButton.tintColor = .white
		
		titleDesign(lbl: cell.engTitleLabel, text: row.media_type, font: .boldSystemFont(ofSize: 20))
		genreDesign(lbl: cell.genreLabel, text: "", font: .systemFont(ofSize: 0))
		rateDesign(lbl: cell.rateLabel, text: "평점", font: .systemFont(ofSize: 5), backgroundColor: .orange)
		ratenumDesign(lbl: cell.rateNumLabel, text: row.vote_average, font: .systemFont(ofSize: 5), backgroundColor: .white)
		titleDesign(lbl: cell.korTitleLabel, text: row.title, font: .boldSystemFont(ofSize: 30))
		genreDesign(lbl: cell.dateLabel, text: row.release_date, font: .systemFont(ofSize: 13))
		
//		let row = mainTvShow.tvShow[indexPath.row]
//
//		genreDesign(lbl: cell.genreLabel, text: row.genre, font:.systemFont(ofSize: 10))
//
//		titleDesign(lbl: cell.engTitleLabel, text: row.title, font: .boldSystemFont(ofSize: 30))
//
//		let url = URL(string: row.backdropImage)
//		let imageURL = try?Data(contentsOf: url!)
//		let image = UIImage(data: imageURL!)
//		posterDesign(imv: cell.posterImageView, image: image!)
//
//		rateDesign(lbl: cell.rateLabel, text:"평점", font: .systemFont(ofSize:5), backgroundColor: .orange)
//		ratenumDesign(lbl: cell.rateNumLabel, text: row.rate, font: .systemFont(ofSize:5), backgroundColor: .white)
//
//		titleDesign(lbl: cell.korTitleLabel, text: row.korTitle, font: .boldSystemFont(ofSize: 30))
//
//		genreDesign(lbl: cell.dateLabel, text: row.releaseDate, font: .systemFont(ofSize: 13))
		
		cell.linkButton.tag = indexPath.row
		cell.linkButton.addTarget(self, action: #selector(linkBittonClicked(selected: )), for: .touchUpInside)

		return cell
	}
	
	@objc func linkBittonClicked(selected: UIButton) {
		
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
		
		let tag = selected.tag
		vc.movieId = mainMovieDate[tag].id
		
		present(vc, animated: true, completion: nil)
		
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "CastViewController") as! CastViewController
		
//		let row = mainTvShow.tvShow[indexPath.row]
		
//		vc.titleText = row.korTitle
//		vc.castUrl = row.backdropImage
		
		let row = mainMovieDate[indexPath.row]
		if let url = URL(string: "https://image.tmdb.org/t/p/original\(row.backdrop_path)") {
			vc.posterUrl = url
		} 
		vc.titleText = row.title
		vc.movieId = row.id
		
		navigationController?.pushViewController(vc, animated: true)
		
		
	}
	
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 350
	}
	
	//prefetchRowAt
	func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
		for indexPath in indexPaths {
			if mainMovieDate.count - 1 == indexPath.row && mainMovieDate.count < totalCount {
				startPage += 10
				fetchData()
			}
		}
	}
	
	func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
		
	}
    
    
}
