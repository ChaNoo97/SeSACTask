//
//  MypageViewController.swift
//  CarrotMarketPractice
//
//  Created by Hoo's MacBookPro on 2021/12/20.
//

import UIKit

class MypageViewController: UIViewController {
	
	let topView: UIView = {
		let view = UIView()
		view.backgroundColor = .blue
		return view
	}()
	
	let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.spacing = 12
		stackView.alignment = .fill
		stackView.distribution = .equalCentering
		return stackView
	}()
	
	let saleView: UIButton = {
		let button = UIButton()
		button.snp.makeConstraints {
			$0.width.equalTo(50)
		}
		// 버튼 동그랗게 하기
//		button.layer.cornerRadius = 0.5 * button.bounds.size.width
		button.backgroundColor = .red
		return button
	}()
	
	let buyingView: UIButton = {
		let button = UIButton()
		button.layer.cornerRadius = 20
		button.backgroundColor = .red
		return button
	}()
	
	let likeView: UIButton = {
		let button = UIButton()
		button.layer.cornerRadius = 30
		button.backgroundColor = .red
		return button
	}()
	

    override func viewDidLoad() {
        super.viewDidLoad()
		[topView,stackView].forEach {
			view.addSubview($0)
		}
		[saleView,buyingView,likeView].forEach {
			stackView.addArrangedSubview($0)
		}
		
		topView.snp.makeConstraints {
			$0.trailing.equalTo(view)
			$0.leading.equalTo(view)
			$0.top.equalTo(view.safeAreaLayoutGuide)
			$0.height.equalTo(view).multipliedBy(0.2)
		}
		
		stackView.snp.makeConstraints {
			$0.leadingMargin.equalTo(topView)
			$0.trailingMargin.equalTo(topView)
			$0.bottom.equalTo(topView)
			$0.height.equalTo(topView).multipliedBy(0.5)
		}
		
		view.backgroundColor = .white
		
    }

}
