//
//  MainTableViewCell.swift
//  shopList
//
//  Created by Hoo's MacBookAir on 2021/11/06.
//

import UIKit

class MainTableViewCell: UITableViewCell {

	static let identifier = "MainTableViewCell"

	@IBOutlet weak var checkButton: UIButton!
	@IBOutlet weak var bookmarkButton: UIButton!
	@IBOutlet weak var contentLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
