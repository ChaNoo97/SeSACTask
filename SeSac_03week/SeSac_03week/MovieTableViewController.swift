//
//  MovieTableViewController.swift
//  SeSac_03week
//
//  Created by Hoo's MacBookAir on 2021/10/13.
//

import UIKit

class MovieTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		//타입 캐스팅
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
			return UITableViewCell()
		}
		
		cell.posterImageView.backgroundColor = .red
		cell.titleLabel.text = "7번방의 선물"
		cell.releaseDateLabel.text = "2021.02.02"
		cell.overviewLabel.text = "영화줄거리가 보이는 곳입니다.영화줄거리가 보이는 곳입니다.영화줄거리가 보이는 곳입니다.영화줄거리가 보이는 곳입니다.영화줄거리가 보이는 곳입니다.영화줄거리가 보이는 곳입니다."
		cell.overviewLabel.numberOfLines = 0
		
		
		return cell
	}
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		//기기마다 스크린크기에 대응
		return UIScreen.main.bounds.height / 5
	}

}
