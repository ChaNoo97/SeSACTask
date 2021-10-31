//
//  VisionAPIViewController.swift
//  SeSac_week05
//
//  Created by Hoo's MacBookAir on 2021/10/27.
//
import Photos
import UIKit
import JGProgressHUD
import SwiftyJSON

/*
 카메라: 시뮬레이터 테스트 불가능 -> 런타임 오류 발생
 - ImagePickerViewController -> PHPickerViewController(iOS14+)
 - iOS14+: 선택 접근 권한 + UI
 */

class VisionAPIViewController: UIViewController {

	@IBOutlet weak var postImageView: UIImageView!
	@IBOutlet weak var resultLabel: UILabel!
	
	@IBOutlet weak var goCameraButton: UIButton!
	@IBOutlet weak var goAlbumButton: UIButton!
	@IBOutlet weak var requireButton: UIButton!
	//언제 Show , Hide
	let progress = JGProgressHUD()
	let imagePicker = UIImagePickerController()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		requireButton.setTitle("require", for: .normal)
		goCameraButton.tintColor = .black
		goAlbumButton.tintColor = .black
		resultLabel.textAlignment = .center
		resultLabel.textColor = .black
		
		view.backgroundColor = .white
		
		
		imagePicker.sourceType = .photoLibrary
		imagePicker.delegate = self
		imagePicker.allowsEditing = true
		
		}
	
	func settingAlert() {
		if let appName = Bundle.main.infoDictionary!["CFBundelName"] as? String {
			let alert = UIAlertController(title: "설정", message: "\(appName)이 카메라 접근이 허용되어 있지 않습니다. 설정화면으로 가시겠습니까?", preferredStyle: .alert)
			let cancleAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
			let confirmAction = UIAlertAction(title: "확인", style: .default) { action in
				UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
			}
			
			alert.addAction(cancleAction)
			alert.addAction(confirmAction)
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	@IBAction func goCameraButtonClicked(_ sender: UIButton) {
		imagePicker.sourceType = .camera
		self.present(self.imagePicker, animated: true, completion: nil)
	}
	
	@IBAction func photoLibraryButtonClicked(_ sender: UIButton) {
		imagePicker.sourceType = .photoLibrary
		self.present(imagePicker, animated: true, completion: nil)
	}
	
	@IBAction func requestButtonClicked(_ sender: UIButton) {
		progress.show(in: view, animated: true)
		VisionAPIManager.shared.fetchFaceData(image: postImageView.image!) { code, json in
			
			let facialAttributes = json["result"]["faces"][0]["facial_attributes"]
			let male = facialAttributes["gender"]["male"]
			let female = facialAttributes["gender"]["female"]
			
			//json -> int 타입 변환 모르겠다..
//			let age = facialAttributes["age"]
//			print(type(of: age))

			
			if male > female {
				self.resultLabel.text = "사진의 인물은 남성입니다."
			} else {
				self.resultLabel.text = "사진의 인물은 여성입니다."
			}
		
			
			self.progress.dismiss(animated: true)
		}
	}
}

extension VisionAPIViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	//사진을 촬영하거나, 갤러리에서 사진을 선택한 직후에 실행
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		print(#function)
		
		//1.선택한 사진 가져오기
		// allowediting false > edtingImage nil
		// allowediting true > editingImage / originalImage
		if let value = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
			//2. 로직: 이미지뷰에 선택한 사진 보여주기
			postImageView.image = value
		}
		//picker dismiss
		picker.dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
		print(#function)
	}
	
	func checkCurrentPhotoAuthorization(_ authorizationStatus: PHAuthorizationStatus) {
		switch authorizationStatus {
		case .notDetermined:
			break
		case .restricted:
			break
		case .denied:
			settingAlert()
		case .authorized:
			break
		case .limited:
			break
		@unknown default:
			print("error")
		}
	}
}
