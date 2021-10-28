//
//  CastTableViewCell.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/18.
//

import UIKit

class CastTableViewCell: UITableViewCell {
	
	static let identifier = "CastTableViewCell"

	@IBOutlet weak var castPotoImage: UIImageView!
	@IBOutlet weak var castNameLabel: UILabel!
	@IBOutlet weak var castCharacterLabel: UILabel!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
