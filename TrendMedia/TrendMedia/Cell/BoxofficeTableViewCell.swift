//
//  BoxofficeTableViewCell.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/11/02.
//

import UIKit

class BoxofficeTableViewCell: UITableViewCell {

	static let identifier = "BoxofficeTableViewCell"
	
	
	@IBOutlet weak var movieNameLabel: UILabel!
	@IBOutlet weak var openDayLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
