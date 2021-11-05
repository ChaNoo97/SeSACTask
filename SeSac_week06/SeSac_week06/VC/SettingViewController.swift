//
//  SettingViewController.swift
//  SeSac_week06
//
//  Created by Hoo's MacBookAir on 2021/11/01.
//

import UIKit
import Zip
import MobileCoreServices

/*
 백업하기
 - 사용자의 아이폰 저장공간 확인
	- 부족 : 백업불가
 - 백업 진행
	- 벡업가능한 파일 여부 확인 realm, folder
	- progress + UI 인터렉션 금지
	- 능력된다면 background 에서 가능하도록
 - zip
	- 백업완료 시점에
	- progress + UI 인터랙션 허용
 - 공유화면
 
 */

/*
 복구하기
 - 사용자의 아이폰 저장공간 확인
 - 파일 앱
	- zip
	- zip 선택
 - zip -> unzip
	- 백업 파일 이름 확인
	- 압축해제
		- 백업 파일 확인: 폴더, 파일 이름
		- 정상적인 파일인가
 - 백업 당시 데이터랑 지금 현재 앱애서 사용중인 데이터 어떻게 합칠건지에 대한 고려
	- 백업 데이터 선택
	-
 */
class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
	
	//1. 도큐먼트 폴더 위치
	func documentDirectoryPath() -> String? {
		let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
		let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
		let path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
		if let directoryPath = path.first {
			return directoryPath
		} else {
			return nil
		}
	}
	
	//7. 공유
	func presentActivityViewController() {
		// 압축파일 경로 가져오기
		let fileName = (documentDirectoryPath()! as NSString).appendingPathComponent("archive.zip")
		let fileURL = URL(fileURLWithPath: fileName)
		
		let vc = UIActivityViewController(activityItems: [fileURL], applicationActivities: [])
		self.present(vc, animated: true, completion: nil)
	}
	@IBAction func activityButtonClicked(_ sender: UIButton) {
		presentActivityViewController()
	}
	
	@IBAction func backupButtonClicked(_ sender: UIButton) {
		
		//4. 백업할 파일에 대한 URL 배열
		var urlPaths = [URL]()
		//1. 도큐먼트 폴더 위치
		if let path = documentDirectoryPath() {
			//2. 백업하고자 하는 파일 URL 확인
			// 이미지 같은 경우 백업 편의성을 위해 폴더를 생성하고, 폴더 내에 이미지를 저장하는것이 효과적
			let realm = (path as NSString).appendingPathComponent("default.realm")
			//3. 백업하고자 하는 파일 존재 여부 확인
			if FileManager.default.fileExists(atPath: realm){
				//5. URL 배열에 백업 파일 URL 추가
				urlPaths.append(URL(string: realm)!)
				print("path:\(path)")
			} else {
				print("백업할 파일이 없습니다.")
			}
		}
		
		//6. zip 파일 만들기
		do {
			let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "archive") // Zip
			print("file: \(zipFilePath)")
			presentActivityViewController()
		}
		catch {
		  print("Something went wrong")
		}
		
	}
	
	@IBAction func restoreButtonClicked(_ sender: UIButton) {
		// 복구 1. 파일앱 열기 + 확장자
		let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeArchive as String], in: .import)
		documentPicker.delegate = self
		//여러파일 선택, 알고잇으면 좋은 잭님 추천
		documentPicker.allowsMultipleSelection = false
		
		self.present(documentPicker, animated: true, completion: nil)
	}
	
	
}

// 파일선택 딜리게이트
extension SettingViewController: UIDocumentPickerDelegate {
	// 파일 선택하면
	func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
		print(#function)
		
		//복구 - 2. 선택한 파일에 대한 경로 가져오기
		//ex. iphone/hoo/fileapp/archive.zip
		guard let selectedFileURL = urls.first else { return }
		
		let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		// lastpathcomponent = archive.zip
		let sandboxFileURL = directory.appendingPathComponent(selectedFileURL.lastPathComponent)
		//복구- 3. 압축해제
		// 파일 있다면 ->
		if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
			do {
				let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
				let fileURL = documentDirectory.appendingPathComponent("archive.zip")
				
				try Zip.unzipFile(fileURL, destination: documentDirectory, overwrite: true, password: nil, progress: { progress in
					print("progress:\(progress)")
					//복구가 완료되었습니다 메세지, 앱을 처음부터 실행해 주세요 얼럿.
					//앱을 처음부터 실행해주는 코드
				}, fileOutputHandler: { unzippedFile in
					print("unzippedFile: \(unzippedFile)")
				})
			} catch {
				print("error")
			}
		} else {
			//복구할 파일이 없다면 ->
			// 파일 앱의 zip -> 도큐먼트 폴더에 복사
			do {
				try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
				let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
				let fileURL = documentDirectory.appendingPathComponent("archive.zip")
				
				try Zip.unzipFile(fileURL, destination: documentDirectory, overwrite: true, password: nil, progress: { progress in
					print("progress:\(progress)")
					//복구가 완료되었습니다 메세지, 앱을 처음부터 실행해 주세요 얼럿.
					//앱을 처음부터 실행해주는 코드
				}, fileOutputHandler: { unzippedFile in
					print("unzippedFile: \(unzippedFile)")
				})
			} catch {
				print("error")
			}
		}
	}
	
	//picker cancel
	func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
		print(#function)
	}
}
