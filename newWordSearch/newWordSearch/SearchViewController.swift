//
//  SearchViewController.swift
//  newWordSerch
//
//  Created by Hoo's MacBookAir on 2021/10/01.
//

import UIKit

class SearchViewController: UIViewController {

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}

	@IBOutlet var mainView: UIView!
	
	@IBOutlet weak var userTextField: UITextField!
	@IBOutlet weak var userSearchButton: UIButton!
	@IBOutlet weak var tagFirstButton: UIButton!
	@IBOutlet weak var tagSecondButton: UIButton!
	@IBOutlet weak var tagThirdButton: UIButton!
	@IBOutlet weak var tagFourthButton: UIButton!
	@IBOutlet weak var resultLabel: UILabel!
	
	var newWordDic : Dictionary<String , String> = ["얼죽아": "얼어죽어도 아메리카노","오놀아놈": "오~좀 놀아본 놈인데?", "복세편살": "복잡한 세상 편하게 살자", "만반잘부": "만나서 반가워,잘 부탁해","자만추":"자연스런 만남 추구","연서복":"연애에 서툰 복학생","낄끼빠빠":"낄 때 끼고 빠질 때 빠져라","인싸":"인사이더 줄임말","마상":"마음의 상처","문찐":"문화찐따","버카충":"버스카드 충전","인구론":"인문계의 90프로는 논다"]

	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		
		
		userTextField.placeholder = "검색어 입력"
		
		userButtonDesign()
		
		tagButtonDesign(tagbutton: tagFirstButton, buttonWord: randomArray()[0])
		tagButtonDesign(tagbutton: tagSecondButton, buttonWord: randomArray()[1])
		tagButtonDesign(tagbutton: tagThirdButton, buttonWord: randomArray()[2])
		tagButtonDesign(tagbutton: tagFourthButton, buttonWord: randomArray()[3])
		
		resultLabelDesing(lbl: resultLabel, labelWord: "신조어 뜻")
		
    }
	
	
	func randomArray() -> Array<String> {
		var newWordKeyArray: Array<String> = []
		for (key,_) in newWordDic{
			newWordKeyArray.append(key)
		}
		let randArray: Array<String> = newWordKeyArray.shuffled()
		
		return randArray
	}
	
	@IBAction func clickTagButton(_ sender: UIButton) {
		userTextField.text = tagFirstButton.currentTitle
	}
	
	@IBAction func clickTagSecondButton(_ sender: UIButton) {
		userTextField.text = tagSecondButton.currentTitle
	}
	
	
	@IBAction func clickTagThirdButton(_ sender: UIButton) {
		userTextField.text = tagThirdButton.currentTitle
	}
	
	@IBAction func clickTagFourthButton(_ sender: UIButton) {
		userTextField.text = tagFourthButton.currentTitle
	}
	
	@IBAction func clickSearchButton(_ sender: UIButton) {
		if let word = newWordDic[userTextField.text!] {
			resultLabel.text = word
		} else {
			resultLabel.text = "단어가 없습니다."
		}
		
		var newWordKeyArray: Array<String> = []
		for (key,_) in newWordDic{
			newWordKeyArray.append(key)
		}
		let _: Array<String> = newWordKeyArray.shuffled()
		
		tagButtonDesign(tagbutton: tagFirstButton, buttonWord: randomArray()[0])
		tagButtonDesign(tagbutton: tagSecondButton, buttonWord: randomArray()[1])
		tagButtonDesign(tagbutton: tagThirdButton, buttonWord: randomArray()[2])
		tagButtonDesign(tagbutton: tagFourthButton, buttonWord: randomArray()[3])
		
	}
	
	@IBAction func tapMainView(_ sender: UITapGestureRecognizer) {
		mainView.endEditing(true)
	}
	
	func userButtonDesign(){
		//코드로 이미지 넣기 알아보기
		userSearchButton.tintColor = .white
		userSearchButton.backgroundColor = .black
	}
   
	func tagButtonDesign(tagbutton : UIButton, buttonWord : String){
		tagbutton.setTitle(buttonWord, for: .normal)
		tagbutton.setTitleColor( .black, for: .normal)
		tagbutton.layer.cornerRadius = 10
		tagbutton.layer.borderColor = UIColor.lightGray.cgColor
		tagbutton.layer.borderWidth = 1
	}
	
	func resultLabelDesing(lbl : UILabel, labelWord : String){
		lbl.text = labelWord
		lbl.textColor = .black
		lbl.textAlignment = .center
	}
	
	
}
