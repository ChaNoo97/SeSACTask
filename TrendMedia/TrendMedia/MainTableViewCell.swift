//
//  MainTableViewCell.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/17.
//

import UIKit

class MainTableViewCell: UITableViewCell {

	static let identifier = "MainTableViewCell"
	
	@IBOutlet weak var genreLabel: UILabel!
	@IBOutlet weak var engTitleLabel: UILabel!
	@IBOutlet weak var posterImageView: UIImageView!
	@IBOutlet weak var rateStackView: UIStackView!
	@IBOutlet weak var rateLabel: UILabel!
	@IBOutlet weak var rateNumLabel: UILabel!
	@IBOutlet weak var korTitleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
