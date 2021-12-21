//
//  ViewController.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/20.
//

import UIKit
import SnapKit
import SwiftUI

class ViewController: UIViewController {
	var toggle = false
	
	let headerView: UIImageView = {
		let view = UIImageView()
		view.backgroundColor = .red
		return view
	}()
	
	let descriptionView: UIView = {
		let view = UIView()
		view.backgroundColor = .green
		return view
	}()
	
	let moreButton: UIButton = {
		let button = UIButton()
		button.setTitle("more", for: .normal)
		button.addTarget(self, action: #selector(moreButtonClicked), for: .touchUpInside)
		return button
	}()
	
	let tableView: UITableView = {
		let tableView = UITableView()
		return tableView
	}()
	
	let bottonView: UIView = {
		let view = UIView()
		view.backgroundColor = .gray
		return view
	}()
	
	let refreshButton: UIButton = {
		let button = UIButton()
		button.setTitle("re", for: .normal)
		button.addTarget(self, action: #selector(refreshButtonClicked), for: .touchUpInside)
		button.backgroundColor = .cyan
		return button
	}()
	
	let shareButton: UIButton = {
		let button = UIButton()
		button.setTitle("share", for: .normal)
		button.addTarget(self, action: #selector(shareButtonClicked), for: .touchUpInside)
		button.backgroundColor = .red
		return button
	}()
	
	@objc func refreshButtonClicked() {
		print(#function)
	}
	
	@objc func shareButtonClicked() {
		print(#function)
	}
	
	func setup() {
		view.addSubview(headerView)
		view.addSubview(tableView)
		view.addSubview(descriptionView)
		descriptionView.addSubview(moreButton)
		view.addSubview(bottonView)
		bottonView.addSubview(refreshButton)
		bottonView.addSubview(shareButton)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableHeaderView = headerView
		
		setup()
		
		
		
//		descriptionView.snp.makeConstraints {
//			$0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
//			$0.height.equalTo(200)
//		}
		
		moreButton.snp.makeConstraints {
			$0.centerX.equalTo(descriptionView)
			$0.bottomMargin.equalTo(descriptionView.snp.bottom).inset(10)
			$0.width.equalTo(60)
			$0.height.equalTo(30)
		}
		
		tableView.snp.makeConstraints {
			$0.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
			$0.bottom.equalTo(view).inset(80)
		}
		
		bottonView.snp.makeConstraints {
			$0.bottom.equalTo(view.safeAreaLayoutGuide)
			$0.leading.trailing.equalTo(view)
			$0.height.equalTo(80)
		}
		
		refreshButton.snp.makeConstraints {
			$0.top.leading.equalTo(bottonView).inset(10)
			$0.width.height.equalTo(60)
		}
		
		shareButton.snp.makeConstraints {
			$0.top.trailing.equalTo(bottonView).inset(10)
			$0.height.equalTo(60)
			$0.leading.equalTo(refreshButton.snp.trailing).offset(10)
		}
		
	}
	
	@objc func moreButtonClicked() {
		toggle.toggle()
	
		if toggle {
			descriptionView.snp.updateConstraints {
				$0.height.equalTo(400)
			}
		}  else {
			descriptionView.snp.updateConstraints {
				   $0.height.equalTo(200)
			   }
		   }
		
	}


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 30
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 100
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(indexPath.row)
	}
	
	
	
	
}

