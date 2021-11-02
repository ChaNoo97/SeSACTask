//
//  ShopinglistTableViewCell.swift
//  SeSacWeek06Shoppinglist
//
//  Created by Hoo's MacBookAir on 2021/11/02.
//

import UIKit

class ShopinglistTableViewCell: UITableViewCell {

	@IBOutlet weak var bookmarkButton: UIButton!
	@IBOutlet weak var checkButton: UIButton!
	@IBOutlet weak var contentLable: UILabel!
	
	static let identifier = "ShopinglistTableViewCell"
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
