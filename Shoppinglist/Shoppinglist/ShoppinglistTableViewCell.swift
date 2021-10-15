//
//  ShoppinglistTableViewCell.swift
//  Shoppinglist
//
//  Created by Hoo's MacBookAir on 2021/10/13.
//

import UIKit

class ShoppinglistTableViewCell: UITableViewCell {

	
	@IBOutlet weak var CheckButton: UIButton!
	@IBOutlet weak var BookmarkButton: UIButton!
	@IBOutlet weak var ContentLabel: UILabel!
	
	var image1 = UIImage(systemName: "star")
	var image2 = UIImage(systemName: "checkmark.square")
	var image3 = UIImage(systemName: "star.fill")
	var image4 = UIImage(systemName: "checkmark.square.fill")
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	@IBAction func CheckButtonClicked(_ sender: UIButton) {
		
	}
	@IBAction func BookmarkButtonClicked(_ sender: UIButton) {
	}
	
}
