//
//  APIService.swift
//  TMDBtask
//
//  Created by Hoo's MacBookPro on 2021/12/21.
//

import Foundation

class APIService {
	let sourceURL = URL(string: "https://api.themoviedb.org/3/search/tv?api_key="+APIHelper.TMDBKey+"&language=en-US&page=1&include_adult=false&query="+APIHelper.query)
	
	func requestSearchTvShows(completion: @escaping (TVShows?) -> Void) {
		guard let sourceURL = sourceURL else {
			print("URL Optional")
			return
		}

		URLSession.shared.dataTask(with: sourceURL) { data, response, error in
			print("data", data)
			print("response", response)
			print("error", error)
			
			if let error = error {
				print("ERROR")
				return
			}
			
			guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
				print("RESPONSE ERROR")
				return
			}
			
			if let data = data, let TvShowsData = try? JSONDecoder().decode(TVShows.self, from: data) {
				print("SUCCEED")
				completion(TvShowsData)
				return
			}
			completion(nil)
		}.resume()
	}
}
