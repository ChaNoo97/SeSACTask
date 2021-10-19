//
//  TestCollectionViewCell.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/20.
//

// TestCollectionViewCell
import UIKit

class TestCollectionViewCell: UICollectionViewCell {
	
	//TestViewController 에서 사용할 identifier static 으로 선언
	static let identifier = "TestCollectionViewCell"
	
	//CollectionViewCell에 들어갈 Label을 아웃렛으로 연결 
	@IBOutlet weak var testLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
