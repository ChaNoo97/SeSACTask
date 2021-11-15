//
//  HomeViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit

class HomeViewController: UIViewController {
	
	@IBOutlet weak var HomeTableView: UITableView!
	
	let array = [
		Array(repeating: "a", count: 20),
		Array(repeating: "b", count: 20),
		Array(repeating: "c", count: 20),
		Array(repeating: "d", count: 20),
		Array(repeating: "e", count: 20),
		Array(repeating: "f", count: 20),
		Array(repeating: "g", count: 20),
		Array(repeating: "h", count: 20)
	]
	
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
		return array.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identfier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
		
		cell.data = array[indexPath.row]
		cell.categoryLabel.text = "\(array[indexPath.row])"
//		cell.categoryLabel.backgroundColor = .blue
		//코드 진행순서 cell awakeNib -> 여기 (우선순위 가 이거인것처럼 보임)
		cell.categoryLabel.backgroundColor = .red
		
		cell.collectionView.backgroundColor = .lightGray
		
		cell.collectionView.tag = indexPath.row
		
//		//딱 멈추는거 (디바이스 전체가 아니면 사용하기 애매함)
//		cell.collectionView.isPagingEnabled = true
//		//dueque 오류 해결 방법
//		cell.collectionView.reloadData()
		
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 170
	}
	
}

