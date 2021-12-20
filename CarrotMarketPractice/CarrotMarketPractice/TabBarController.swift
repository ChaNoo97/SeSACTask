//
//  TabBarController.swift
//  CarrotMarketPractice
//
//  Created by Hoo's MacBookPro on 2021/12/19.
//

import UIKit

class TabBarController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureTabBarController()
		setupTabBarAppearence()
		
	}
	
	func configureTabBarController() {
		let firstVC = MainViewController()
		firstVC.tabBarItem.title = "홈"
		firstVC.tabBarItem.image = UIImage(systemName: "star")
		firstVC.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
		
		let secondVC = MypageViewController()
		secondVC.tabBarItem.title = "나의 당근"
		secondVC.tabBarItem.image = UIImage(systemName: "star")
		secondVC.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
		
		setViewControllers([firstVC, secondVC], animated: true)
	}
	
	func setupTabBarAppearence() {
		let appearence = UITabBarAppearance()
		appearence.configureWithOpaqueBackground()
		appearence.backgroundColor = .white
		tabBar.standardAppearance = appearence
		tabBar.scrollEdgeAppearance = appearence
		tabBar.tintColor = .black
	}
}

extension TabBarController: UITabBarControllerDelegate {
	
	override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
		print(item)
	}
}
