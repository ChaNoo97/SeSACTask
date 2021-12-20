//
//  MainViewController.swift
//  CarrotMarketPractice
//
//  Created by Hoo's MacBookPro on 2021/12/19.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
	
	let testButton: UIButton = {
		let button = UIButton()
		button.setTitle("nav", for: .normal)
		button.addTarget(self, action: #selector(clickNavButton), for: .touchUpInside)
		button.backgroundColor = .green
		return button
	}()
	
	let testView: UIView = {
		let view = UIView()
		view.backgroundColor = .red
		return view
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		[testView,testButton].forEach {
			view.addSubview($0)
		}
		
		testButton.snp.makeConstraints {
			$0.leadingMargin.equalTo(view)
			$0.trailingMargin.equalTo(view)
			$0.top.equalTo(view.safeAreaLayoutGuide)
			$0.height.equalTo(view).multipliedBy(0.1)
		}
        
		testView.snp.makeConstraints {
			$0.leadingMargin.equalTo(view)
			$0.trailingMargin.equalTo(view)
			$0.top.equalTo(testButton.snp.bottom)
			$0.height.equalTo(view).multipliedBy(0.1)
		}
    }
    
	@objc func clickNavButton() {
		let vc = MypageViewController()
		navigationController?.pushViewController(vc, animated: true)
		print("click")
	}

}
