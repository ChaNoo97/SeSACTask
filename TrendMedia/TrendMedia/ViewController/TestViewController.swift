//
//  TestViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/20.
//

import UIKit

class TestViewController: UIViewController {

	//메인 스토리보드에서 추가한 collectionview 를 아웃렛으로 연결
	@IBOutlet weak var testCollctionView: UICollectionView!
	
	//testCollectionView class
	override func viewDidLoad() {
        super.viewDidLoad()
		testCollctionView.backgroundColor = .lightGray
		//반드시 채택해야하는 프로토콜
		testCollctionView.delegate = self
		testCollctionView.dataSource = self
        
		let nibName = UINib(nibName: TestCollectionViewCell.identifier, bundle: nil)
		//register 코드 작성
		testCollctionView.register(nibName, forCellWithReuseIdentifier: TestCollectionViewCell.identifier)
		
		//cell Layout
		let layout = UICollectionViewFlowLayout()
		let spacing: CGFloat = 20
		let width = UIScreen.main.bounds.width - (spacing*3)
		layout.itemSize = CGSize(width: width/2, height: width/2)
		//셀과 베젤사이 간격
		layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
		//셀과 셀 사이 간격
		layout.minimumLineSpacing = spacing
		layout.minimumInteritemSpacing = spacing
		//스크롤 방향
		layout.scrollDirection = .horizontal //가로
//		layout.scrollDirection = .vertical //세로

		testCollctionView.collectionViewLayout = layout
		
    }
}
//testCollectionView class
//TestViewController에 UICollectionViewDelegat 와 UICollectionViewDataSource protocol 사용
extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 15
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = testCollctionView.dequeueReusableCell(withReuseIdentifier: TestCollectionViewCell.identifier, for: indexPath) as? TestCollectionViewCell else{return UICollectionViewCell()}
		//cell의 배경 색 지정
		cell.backgroundColor = .systemMint
		return cell
	}
}
