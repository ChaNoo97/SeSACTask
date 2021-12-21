//
//  ViewController.swift
//  TMDBtask
//
//  Created by Hoo's MacBookPro on 2021/12/21.
//

import UIKit
import SnapKit
import XCTest

class ViewController: UIViewController {
	
	let api = APIService()
	var tvShowsData: TVShows?
	var image: UIImage?
	
	var searchCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.minimumLineSpacing = 10
		layout.scrollDirection = .vertical
		layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		return cv
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		api.requestSearchTvShows { TVShows in
			self.tvShowsData = TVShows
			print(TVShows?.results)
			DispatchQueue.main.async {
				self.searchCollectionView.reloadData()
			}
			
			
		}
		configureCollectionView()
		registerCollectionView()
		collectionViewDelegate()
	}
	
	func configureCollectionView() {
		searchCollectionView.backgroundColor = .white
		view.addSubview(searchCollectionView)
		searchCollectionView.snp.makeConstraints {
			$0.edges.equalTo(view.safeAreaLayoutGuide)
		}
	}
	
	func registerCollectionView() {
		searchCollectionView.register(SearchCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "SearchCollectionViewCell.reusIdentifier")
	}
	
	func collectionViewDelegate() {
		searchCollectionView.delegate = self
		searchCollectionView.dataSource = self
	}
	
	func loadImage(url: String?) -> UIImage {
		guard let urls = url else { return UIImage() }
		let URL = URL(string: "https://image.tmdb.org/t/p/original"+urls)!
		DispatchQueue.global().async {
			let data = try? Data(contentsOf: URL)
			DispatchQueue.main.async {
				self.image = UIImage(data: data!)!
			}
		}
		guard let image = image else { return UIImage() }
		
		return image
	}
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let spacing: CGFloat = 10
		let width = searchCollectionView.bounds.width - 4*spacing
		let height = searchCollectionView.bounds.height - 5*spacing
		return CGSize(width: floor(width/3), height: height/4)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return tvShowsData?.results.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell.reusIdentifier", for: indexPath) as! SearchCollectionViewCell
		cell.posterImage.image = loadImage(url: tvShowsData?.results[indexPath.row].posterPath)
		return cell
	}

}

extension ViewController: UISearchBarDelegate {
	
}

