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
	
//	let api = APIService()
	
	var searchCollectionView: SearchCollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		configureCollectionView()
		registerCollectionView()
		collectionViewDelegate()
	}
	
	func configureCollectionView() {
		searchCollectionView = SearchCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
		searchCollectionView.backgroundColor = .white
		searchCollectionView.addSubview(view)
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

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 100, height: 100)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 20
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell.reusIdentifier", for: indexPath) as! SearchCollectionViewCell
		cell.posterImage.image = UIImage(systemName: "star")
		return cell
	}

}

extension ViewController: UISearchBarDelegate {
	
}

