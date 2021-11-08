//
//  HomeTableViewCell.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/08.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

	static let identfier = "HomeTableViewCell"
	
	@IBOutlet weak var categoryLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
//		cell.collectionView.dataSource = self
//		cell.collectionView.delegate = self
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
