//
//  StretchyViewController.swift
//  StretchyTableView
//
//  Created by Hoo's MacBookPro on 2021/12/21.
//

import UIKit
import SnapKit

class StretchyViewController: UIViewController {

	
	let tableView: UITableView = {
		let view = UITableView()
		view.register(StretchyTabelViewCell.self, forCellReuseIdentifier: StretchyTabelViewCell.reuseIdentifier)
		return view
	}()
	

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		
		view.addSubview(tableView)
		
		tableView.snp.makeConstraints {
			$0.edges.equalTo(view.safeAreaLayoutGuide)
		}
		
    }
    

   

}

extension StretchyViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 100
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: StretchyTabelViewCell.reuseIdentifier) as! StretchyTabelViewCell
		cell.personImage.image = UIImage(systemName: "star")
		cell.personName.text = "person Name"
		cell.personAge.text = "person age"
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 64
	}


}
