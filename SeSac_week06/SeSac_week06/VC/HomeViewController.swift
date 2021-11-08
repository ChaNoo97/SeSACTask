//
//  HomeViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit

class HomeViewController: UIViewController {
	
	@IBOutlet weak var HomeTableView: UITableView!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		HomeTableView.delegate = self
		HomeTableView.dataSource = self
		
		
    }
    

	@IBAction func plusButtonClick(_ sender: UIButton) {
		
		let sb = UIStoryboard(name: "Content", bundle: nil)
		let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
		
		let nav = UINavigationController(rootViewController: vc)
		nav.modalPresentationStyle = .fullScreen
		
		present(nav, animated: true, completion: nil)
		
		
	}
	

}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identfier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
		
		cell.categoryLabel.backgroundColor = .yellow
		cell.collectionView.backgroundColor = .lightGray
		
		cell.collectionView.dataSource = self
		cell.collectionView.delegate = self
		
		cell.collectionView.tag = indexPath.row
		
		//딱 멈추는거 (디바이스 전체가 아니면 사용하기 애매함)
		cell.collectionView.isPagingEnabled = true
		
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 170
	}
	
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 20
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
		
		cell.imageView.backgroundColor = .brown
		
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		if collectionView.tag == 0 {
			return CGSize(width: UIScreen.main.bounds.width, height: 100)
		} else {
			return CGSize(width: 150, height: 100)
		}
		
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		if collectionView.tag == 0 {
			return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		} else {
			return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return collectionView.tag == 0 ? 0 : 10
	}
}
