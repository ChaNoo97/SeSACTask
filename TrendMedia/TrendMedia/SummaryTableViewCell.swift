//
//  SummaryTableViewCell.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/20.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {

	
	@IBOutlet weak var summaryLabel: UILabel!
	@IBOutlet weak var addButton: UIButton!
	
	static let identifier = "SummaryTableViewCell"
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
