//
//  ViewController.swift
//  TabbarExample
//
//  Created by Hoo's MacBookPro on 2022/01/27.
//

import UIKit

class ViewController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		configureTabBarController()
		setupTabBarAppearence()
	}
	
	func configureTabBarController() {
		let firstVC = firstVC()
		firstVC.tabBarItem.title = "퍼스트"
		firstVC.tabBarItem.image = UIImage(systemName: "star")
		firstVC.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
		let secondVC = secondVC()
		secondVC.tabBarItem.title = "세컨"
		secondVC.tabBarItem.image = UIImage(systemName: "star")
		secondVC.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
		let thirdVC = thirdVC()
		thirdVC.tabBarItem.title = "써드"
		thirdVC.tabBarItem.image = UIImage(systemName: "star")
		thirdVC.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
		let thirdNav = UINavigationController(rootViewController: thirdVC)
		setViewControllers([firstVC, secondVC, thirdNav], animated: true)
	}
	
	func setupTabBarAppearence() {
		// iOS~13
		let appearence = UITabBarAppearance()
		appearence.configureWithTransparentBackground()
		appearence.backgroundColor = .white
		tabBar.standardAppearance = appearence
		tabBar.scrollEdgeAppearance = appearence
		tabBar.tintColor = .lightGray
	}

}

