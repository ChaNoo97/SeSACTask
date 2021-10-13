//
//  ExampleViewController.swift
//  EmotionDiarymine
//
//  Created by Hoo's MacBookAir on 2021/10/08.
//

import UIKit

//enum GameJob {
//	case rogue //도적
//	case warrior //전사
//	case mystic //도사
//	case shaman //주술사
//	case fight //전사
//}

class ExampleViewController: UIViewController {
	

    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = setViewBackground()
		
		setViewBackground()
    }
    
	// 1. 반환값의 타입을 옵셔널 타입으로 변경: UIColor -> UIColor?
	// 2. 반환될 값을 강제 해제 random.randomElement()!
	// 3. 반환될 값: ??
	@discardableResult
	func setViewBackground() -> UIColor {
		let random: [UIColor] = [.red, .black, .gray, .green]
		return random.randomElement() ?? UIColor.yellow
		//return random.randomElement()! //강제해제
	}

	@IBAction func showAlert(_ sender: UIButton) {
		//1. UIAlertController 생성 : 밑바탕 + 타이틀 + 본문
		let alert = UIAlertController(title: "타이틀 테스트", message: "메세지가 입력되었습니다", preferredStyle: .alert)
		
		//2. UIAlertAction 생성 : 버튼들 ...
		let ok = UIAlertAction(title:"아이폰겟!",style: .default)
		let ok2 = UIAlertAction(title: "맥북 겟!", style: .default)
		let iPad = UIAlertAction(title: "아이패드!", style: .cancel)
		let watch = UIAlertAction(title: "와치", style: .destructive)
		
		//3. 1+2
		alert.addAction(ok2)
		alert.addAction(ok)
		alert.addAction(iPad)
		alert.addAction(watch)
		
//		//컬러피커
//		let colorPickert = UIColorPickerViewController()
		//4. Present
		present(alert, animated: true, completion: nil)
		
	}
}
