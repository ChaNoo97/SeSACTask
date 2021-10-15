//
//  MainViewController.swift
//  ssac1015
//
//  Created by Hoo's MacBookAir on 2021/10/15.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	@IBAction func MemoBtn(_ sender: Any) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "MemoViewController")
//		let nav = UINavigationController(rootViewController: vc)
		navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func MovieBtn(_ sender: Any) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "MovieViewController")
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true, completion: nil)
	}
	

}
