//
//  VideoCollectionViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/19.
//

import UIKit

class VideoCollectionViewController: UIViewController {

	@IBOutlet weak var posterColectionView: UICollectionView!
	
	let videoTvShow = tvshowList()
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		posterColectionView.delegate = self
		posterColectionView.dataSource = self

		let nibName = UINib(nibName: VideoCollectionViewCell.identifier , bundle: nil)
		posterColectionView.register(nibName, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
		
		let layout = UICollectionViewFlowLayout()
		let spacing: CGFloat = 20
		let spacing2: CGFloat = 30
		let width = UIScreen.main.bounds.width - (spacing*4)
		layout.itemSize = CGSize(width: width/2 , height: width/2)
		layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing2, bottom: spacing, right: spacing2)
		layout.minimumInteritemSpacing = spacing
		layout.minimumLineSpacing = spacing
		layout.scrollDirection = .vertical
		posterColectionView.collectionViewLayout = layout
    }
    
}

extension VideoCollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return videoTvShow.tvShow.count
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let item = videoTvShow.tvShow[indexPath.item]
		guard let cell = posterColectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as? VideoCollectionViewCell else { return UICollectionViewCell() }
		
		let url = URL(string: item.backdropImage)
		let data = try? Data(contentsOf: url!)
		
		cell.titleLabel.text = item.title
		cell.titleLabel.textColor = .white
		cell.titleLabel.font = .boldSystemFont(ofSize: 20)
		cell.rateLabel.text = "\(item.rate)"
		cell.rateLabel.textColor = .white
		cell.rateLabel.font = .systemFont(ofSize: 15)
		cell.posterImage.image = UIImage(data: data!)
		cell.posterImage.contentMode = .scaleAspectFill
		cell.backgroundColor = .systemMint
		cell.layer.cornerRadius = 10
		
		return cell
		
	}
	

}
