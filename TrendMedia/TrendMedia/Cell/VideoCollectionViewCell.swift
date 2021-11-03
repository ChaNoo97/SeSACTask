//
//  VideoCollectionViewCell.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/19.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "VideoCollectionViewCell"
	
	@IBOutlet weak var rateLabel: UILabel!
	@IBOutlet weak var posterImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
