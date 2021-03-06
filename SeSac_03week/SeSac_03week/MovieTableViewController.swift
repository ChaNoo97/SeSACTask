//
//  MovieTableViewController.swift
//  SeSac_03week
//
//  Created by Hoo's MacBookAir on 2021/10/13.
//

import UIKit

class MovieTableViewController: UITableViewController {

	let movieInformation = MovieInformation()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(closeButtonClicked))
    }
	@objc func closeButtonClicked() {
		
		//Push - Pop
		//Push: Dismiss X , Present: Pop X
//		self.navigationController?.popViewController(animated: true)
		self.navigationController?.dismiss(animated: true, completion: nil)
		
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movieInformation.movie.count
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		//타입 캐스팅
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
			return UITableViewCell()
		}
		
		let row = movieInformation.movie[indexPath.row]
		
		cell.posterImageView.image = UIImage(named: row.title)
		cell.titleLabel.text = row.title
		cell.releaseDateLabel.text = row.releaseDate
		cell.overviewLabel.text = row.overview
		cell.overviewLabel.numberOfLines = 0
		
		
		return cell
	}
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		//기기마다 스크린크기에 대응
		return UIScreen.main.bounds.height / 5
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let sb = UIStoryboard(name: "Movie", bundle: nil)
		
		guard let vc = sb.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else {
			print("Error")
			return
		}
		
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
