//
//  HomeViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

	@IBAction func plusButtonClick(_ sender: UIButton) {
		
		let sb = UIStoryboard(name: "Content", bundle: nil)
		let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
		
		let nav = UINavigationController(rootViewController: vc)
		nav.modalPresentationStyle = .fullScreen
		
		present(nav, animated: true, completion: nil)
		
		
	}
	

}
