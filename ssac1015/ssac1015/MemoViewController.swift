
//
//  MemoViewController.swift
//  ssac1015
//
//  Created by Hoo's MacBookAir on 2021/10/15.
//

import UIKit

class MemoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
	
	@IBOutlet weak var memoTableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		memoTableView.delegate = self
		memoTableView.dataSource = self
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell") else {return UITableViewCell()}
		cell.textLabel?.text = "Memo\(indexPath)"
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(indexPath)
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoDetailViewController") as! MemoDetailViewController
		let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "MemoDetail2ViewController") as! MemoDetail2ViewController
		
		switch indexPath.row {
		case 0:
			navigationController?.pushViewController(vc, animated: true)
			break
		case 1:
			navigationController?.pushViewController(vc2, animated: true)
			break
		default: navigationController?.popViewController(animated: true)
		}
	}
}

