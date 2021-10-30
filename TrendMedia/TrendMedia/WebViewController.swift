//
//  WebViewController.swift
//  TrendMedia
//
//  Created by Hoo's MacBookAir on 2021/10/29.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
	
	var movieId: Int = 0
	
	var destination = "" {
		didSet {
			openWebPage(to: destination)
		}
	}
	
	@IBOutlet weak var WebView: WKWebView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		fetchURL()
		
    }
    
	func openWebPage(to urlStr: String) {
		guard let url = URL(string: urlStr) else {
			return print("error")
		}
		let requset = URLRequest(url: url)
		WebView.load(requset)
	}
	
	func fetchURL() {
		TMDBManager.shared.fetchUrlData(apikey: APIkey.TMDB_KEY, movieid: movieId) { json in
			print(json)
			
			let result = json["results"][0]
			self.destination = "https://www.youtube.com/watch?v=\(result["key"])"
			print(result["key"])
		}
	}

}
