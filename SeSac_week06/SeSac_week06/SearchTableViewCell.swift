//
//  SearchTableViewCell.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

	@IBOutlet weak var contentLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var photoImageView: UIImageView!
	
	func configureCell(row: UserDiary) {
		titleLabel.text = row.diaryTitle
		titleLabel.font = UIFont().SCDream5
		
		contentLabel.text = row.diaryContent
		contentLabel.numberOfLines = 0
		contentLabel.font = UIFont().SCDream2
	}
	
	static let identifier = "SearchTableViewCell"
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	
}
