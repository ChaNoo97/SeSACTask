//
//  MovieTableViewCell.swift
//  SeSac_03week
//
//  Created by Hoo's MacBookAir on 2021/10/13.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
	
	static let identifier = "MovieTableViewCell"
	
	@IBOutlet weak var posterImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var releaseDateLabel: UILabel!
	@IBOutlet weak var overviewLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
