//
//  ScenelifecycleViewController.swift
//  Bamin
//
//  Created by Hoo's MacBookAir on 2021/10/05.
//

import UIKit

class ScenelifecycleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		print(self,#function)
		
        // Do any additional setup after loading the view.
    }
	override func viewWillAppear(_ animated: Bool) {
		print(self, #function)
	}
	override func viewWillDisappear(_ animated: Bool) {
		print(self, #function)
	}
	
}

class oneViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		print(self, #function)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		print(self, #function)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		print(self, #function)
	}

}

class twoViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		print(self, #function)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		print(self, #function)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		print(self, #function)
	}

}

class threeViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		print(self, #function)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		print(self, #function)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		print(self, #function)
	}

}

class fourViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		print(self, #function)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		print(self, #function)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		print(self, #function)
	}

}

