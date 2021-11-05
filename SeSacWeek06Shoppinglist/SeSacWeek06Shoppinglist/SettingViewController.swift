//
//  SettingViewController.swift
//  SeSacWeek06Shoppinglist
//
//  Created by Hoo's MacBookAir on 2021/11/04.
//

import UIKit
import Zip
import MobileCoreServices

class SettingViewController: UIViewController {
	@IBOutlet weak var backUpButton: UIButton!
	@IBOutlet weak var restorButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		buttonDesgin(btn: backUpButton, title: "백 업")
		buttonDesgin(btn: restorButton, title: "복 구")
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(xmarkButtonClicked))
		navigationItem.leftBarButtonItem?.tintColor = .lightGray
    }
    
	@objc func xmarkButtonClicked() {
		dismiss(animated: true, completion: nil)
	}
	
	// 7. zip 파일 공유하기
	func presentActivityViewController() {
		//압축파일 경로 가져오기
		let fileName = (documentDirectoryPath()! as NSString).appendingPathComponent("achiveshop.zip")
		let fileURL = URL(fileURLWithPath: fileName)
		
		let vc = UIActivityViewController(activityItems: [fileURL], applicationActivities: [])
		self.present(vc, animated: true, completion: nil)
	}
	
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
	
	@IBAction func backupButtonClicked(_ sender: UIButton) {
		//4. 백업할 파일에 대한 URL 배열 선언
		var urlPaths = [URL]()
		if let path = documentDirectoryPath() {
			//2. 백업하고자 하는 파일 url 확인
			let realm = (path as NSString).appendingPathComponent("default.realm")
			//3. 백업하고자 하는 파일 존재 여부 확인
			if FileManager.default.fileExists(atPath: realm) {
				//5. URL 배열에 백업 파일 URL 추가
				urlPaths.append(URL(string: realm)!)
				print("path: \(path)")
			} else {
				print("백업할 파일이 없습니다.")
			}
		}
		
		//6. zip 파일 만들기
		do {
			let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "archiveshop")
			print("file: \(zipFilePath)")
			presentActivityViewController()
		} catch {
			print("something went wrong")
		}
	}
	
	@IBAction func restoreButtonClicked(_ sender: UIButton) {
		let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeArchive as String], in: .import)
		documentPicker.delegate = self
		documentPicker.allowsMultipleSelection = false
		
		self.present(documentPicker, animated: true, completion: nil)
	}
	
	func buttonDesgin(btn: UIButton, title: String) {
		btn.setTitle(title, for: .normal)
		btn.layer.cornerRadius = 10
		btn.layer.borderWidth = 2
		btn.layer.borderColor = UIColor.lightGray.cgColor
		btn.tintColor = .black
	}
}

extension SettingViewController: UIDocumentPickerDelegate {
	func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
		print(#function)
		
		//복구 2. 선택한 파일에 대한 경로 가져오기
		guard let selectedFileURL = urls.first else { return }
		
		let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		let sandboxFileURL = directory.appendingPathComponent(selectedFileURL.lastPathComponent)
		//복구 3. 압축해제
		//파일 있다면 ->
		if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
			do {
				let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
				let fileURL = documentDirectory.appendingPathComponent("archiveshop.zip")
				
				try Zip.unzipFile(fileURL, destination: documentDirectory, overwrite: true, password: nil, progress: { progress in
					print("progress: \(progress)")
				}, fileOutputHandler: { unzippedFile in
					print("unZippedFile:\(unzippedFile)")
				})
			} catch {
				print("error")
			}
		} else {
			//복구할 파일이 없다면 ->
			do {
				try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
				let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
				let fileURL = documentDirectory.appendingPathComponent("archiveshop.zip")
				
				try Zip.unzipFile(fileURL, destination: documentDirectory, overwrite: true, password: nil, progress: { progress in
					print("progress: \(progress)")
				}, fileOutputHandler: { unzippedFile in
					print("unzippedFile:\(unzippedFile)")
				})
			} catch {
				print("error")
			}
		}
	}
	func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
		print(#function)
	}
}
