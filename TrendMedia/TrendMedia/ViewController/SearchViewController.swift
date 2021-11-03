//
//  SearchViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITableViewDataSourcePrefetching{
	
	//셀이 화면에 보이기 전에 필요한 리소스를 미리 다운 받는 기능
	func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
		for indexPath in indexPaths {
			if movieData.count - 1 == indexPath.row && movieData.count < totalCount {
				startPage += 10
				fetchMovieData(query: searchBar.text!)
				print("prefetch: \(indexPath)")
			}
		}
	}
	
	//취소
	func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
		print("취소: \(indexPaths)")
	}
	
	
	var movieData: [MovieModel] = []
	
	@IBOutlet var mainView: UIView!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var searchBar: UISearchBar!
	
	let searchTvShow = tvshowList()
	var startPage = 1
	var totalCount = 29
	
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.prefetchDataSource = self
		searchBar.delegate = self
		
		mainView.backgroundColor = .black
		buttonDesign(btn: backButton, systemimagename: "xmark", color: .white)
		searchBar.backgroundColor = .black
//		searchBar.showsCancelButton = true
		tableView.backgroundColor = .black
		
		fetchMovieData(query: "")
    }
	
	func fetchMovieData(query: String) {
		if let quary = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
			let url = "https://openapi.naver.com/v1/search/movie.json?query=\(quary)&display=10&start=\(startPage)"
			
			let header: HTTPHeaders = [
				"X-Naver-Client-Id": "qJHHItGwozCDDcp7wrIF",
				"X-Naver-Client-Secret": "cIYyW3stAe"
			]
			
			AF.request(url, method: .get, headers: header).validate().responseJSON { response in
				switch response.result {
				case .success(let value):
					let json = JSON(value)
					print("JSON: \(json)")
					
					for item in json["items"].arrayValue {
						
						let value = item["title"].stringValue.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
						let image = item["image"].stringValue
						let link = item["link"].stringValue
						let userRating = item["userRating"].stringValue
						let sub = item["subtitle"].stringValue
						
						let data = MovieModel(titleData: value, imageData: image, linkData: link, userRatingData: userRating, subtitle: sub)
						
						self.movieData.append(data)
					}
					
					//중요!!!
					self.tableView.reloadData()
					
				case .failure(let error):
					print(error)
				}
			}
		}
	}
    
	@IBAction func backButtonclicked(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movieData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier,for: indexPath) as? SearchTableViewCell else {return UITableViewCell()}
		
		let row = movieData[indexPath.row]
		
		if let url = URL(string: row.imageData) {
			cell.posterImage.kf.setImage(with: url)
		} else {
			cell.posterImage.image = UIImage(systemName: "star")
		}
		
		cell.titleLabel.text = row.titleData
		cell.subTitleLabel.text = row.subtitle
		cell.overviewLabel.text = row.userRatingData
		
//		let row = searchTvShow.tvShow[indexPath.row]
//		cell.backgroundColor = .black
//		cell.titleLabel.text = row.title
//		cell.titleLabel.textColor = .white
//		cell.titleLabel.font = .boldSystemFont(ofSize: 15)
//		cell.subTitleLabel.text = "\(row.releaseDate) +/+\(row.region)"
//		cell.subTitleLabel.textColor = .white
//		cell.subTitleLabel.font = .systemFont(ofSize: 10)
//		cell.overviewLabel.text = row.overview
//		cell.overviewLabel.numberOfLines = 0
//		cell.overviewLabel.textColor = .lightGray
//		cell.overviewLabel.font = .systemFont(ofSize: 12)
//
//		let url = URL(string: row.backdropImage)
//		let data = try? Data(contentsOf: url!)
//		cell.posterImage.image = UIImage(data: data!)

		return cell 
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
}

extension SearchViewController: UISearchBarDelegate {
	// 검색버튼 == 키보드 리턴버튼
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		print(#function)
		if let text = searchBar.text {
			movieData.removeAll()
			startPage = 1
			fetchMovieData(query: text)
		}
	}
	
	//취소 버튼 눌렀을 때 실행
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		print(#function)
		movieData.removeAll()
		tableView.reloadData()
//		searchBar.showsCancelButton = false
		searchBar.setShowsCancelButton(false, animated: true)
	}
	
	//서치바에 커서 시작
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		print(#function)
//		searchBar.showsCancelButton = true
		searchBar.setShowsCancelButton(true, animated: true)
	}
	
}
