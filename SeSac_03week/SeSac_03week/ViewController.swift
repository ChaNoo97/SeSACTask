//
//  ViewController.swift
//  SeSac_03week
//
//  Created by Hoo's MacBookAir on 2021/10/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//		setBackgroundColor()
        // Do any additional setup after loading the view.
    }
    
	//Present - Dismiss
	@IBAction func memoButtonClicked(_ sender: UIButton) {
		//1. 스토리보드 특정
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		//2. 스토리보드 내 많은 뷰 컨트롤러 중 전환하고자 하는 뷰 컨트롤러 가져오기
		let vc = storyboard.instantiateViewController(withIdentifier: "MemoTableViewController") as! MemoTableViewController
		
		//2-1. 네비게이션 컨트롤러 임베드
		let nav = UINavigationController(rootViewController: vc)
		
		//(옵션)
		nav.modalTransitionStyle = .partialCurl
		nav.modalPresentationStyle = .fullScreen
		
		//3. Present
		present(nav,animated: true, completion: nil)
		
	}
	
	@IBAction func MovieButtonClicked(_ sender: UIButton) {
		//버튼이 눌리는지 확인
		print(#function)
		//1. 스토리보드 특정
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		//2. 스토리보드 내 많은 뷰 컨트롤러 중 전환하고자 하는 뷰 컨트롤러 가져오기
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieTableViewController") as! MovieTableViewController
		// 3.Push
		self.navigationController?.pushViewController(vc, animated: true)
	}
	/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
