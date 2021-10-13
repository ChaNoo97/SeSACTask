//
//  SettingTableViewController.swift
//  SeSac_03week
//
//  Created by Hoo's MacBookAir on 2021/10/12.
//

import UIKit

class SettingTableViewController: UITableViewController {
	@IBOutlet weak var TitleLabel: UILabel!
	let sectionList: [String] = ["전체설정","개인설정","기타"]
	let wholeSettingList: [String] = ["공지사항","실험실","버전정보"]
	let individualSettingList: [String] = ["개인/보안","알림","채팅","멀티프로필"]
	let othersSettingList: [String] = ["공지사항/도움말"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		TitleLabel.text = "설정"
		TitleLabel.textColor = setColor()
		TitleLabel.textAlignment = .center
		TitleLabel.font = .boldSystemFont(ofSize: 15)
    }
	
	
	func setColor()->UIColor {
		//백그라운드 상태에서 다크모드 전환시 색상 바뀌지 않음
		if traitCollection.userInterfaceStyle == .dark {
			return .white
		} else {
			return .black
		}
	}

    override func numberOfSections(in tableView: UITableView) -> Int {
		
		return sectionList.count
    }
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section==0 {
			return sectionList[0]
		} else if section == 1 {
			return sectionList[1]
		} else if section == 2{
			return sectionList[2]
		} else {
			return "섹션타이틀"
		}
	}
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0{
			return wholeSettingList.count
		} else if section == 1{
			return individualSettingList.count
		} else if section == 2{
			return othersSettingList.count
		} else { //자동으로 하는 방법 찾아보기
			return 3
		}
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingcell") else {
			return UITableViewCell()
		}
		cell.textLabel?.textColor = setColor()
		cell.textLabel?.textAlignment = .left
		cell.textLabel?.font = .systemFont(ofSize: 15)
		if indexPath.section == 0 {
			cell.textLabel?.text = wholeSettingList[indexPath.row]
		} else if indexPath.section == 1 {
			cell.textLabel?.text = individualSettingList[indexPath.row]
		} else if indexPath.section == 2 {
			cell.textLabel?.text = othersSettingList[indexPath.row]
		} else {
			cell.textLabel?.text = "-"
		}
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 44
	}
	
	

}
