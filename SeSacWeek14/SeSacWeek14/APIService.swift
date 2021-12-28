//
//  APIService.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/27.
//

import Foundation

enum APIError: Error {
	case invalidResponse
	case noData
	case failed
	case invalidData
}

class APIService {
	
	static func login(identifier: String, password: String, completion: @escaping (User?, APIError?) -> Void) {
		let url = URL(string: "http://test.monocoding.com/auth/local")!
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		// string -> Data, dictionary -> jsonSerialization / codable
		request.httpBody = "identifier=\(identifier)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
		URLSession.shared.dataTask(with: request) { data, response, error in
			print(data,response,error)
			guard error == nil else {
				completion(nil, .failed)
				return
			}
			guard let data = data else {
				completion(nil, .noData)
				return
			}
			guard let response = response as? HTTPURLResponse else {
				completion(nil, .invalidResponse)
				return
			}
			guard response.statusCode == 200 else {
				completion(nil, .failed)
				return
			}
			
			do {
				let decoder = JSONDecoder()
				let userData = try decoder.decode(User.self, from: data)
				completion(userData, nil)
			} catch {
				completion(nil, .invalidData)
			}
			
		}.resume()
		
		
	}
	
	static func signUp(username: String, email: String, password: String, completion: @escaping (User?, APIError?) -> Void) {
		let url = URL(string: "http://test.monocoding.com/auth/local/register")!
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = "username=\(username)&email=\(email)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			print("Data",data)
			print("response", response)
			print("error",error)
			guard error == nil else {
				completion(nil, .failed)
				return
			}
			guard let data = data else {
				completion(nil, .noData)
				return
			}
			guard let response = response as? HTTPURLResponse else {
				completion(nil, .invalidResponse)
				return
			}
			guard response.statusCode == 200 else {
				completion(nil, .failed)
				return
			}
			
			do {
				let decoder = JSONDecoder()
				let userData = try decoder.decode(User.self, from: data)
				completion(userData, nil)
			} catch {
				completion(nil, .invalidData)
			}
		}.resume()
	}
	
	static func lotto(_ number: Int, completion: @escaping (Lotto?, APIError?) -> Void) {
		let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)")!
	
		URLSession.shared.dataTask(with: url) { data, response, error in
			print(Thread.isMainThread)
			DispatchQueue.main.async {
				print(Thread.isMainThread)
				guard error == nil else {
					completion(nil, .failed)
					return
				}
				guard let data = data else {
					completion(nil, .noData)
					return
				}
				guard let response = response as? HTTPURLResponse else {
					completion(nil, .invalidResponse)
					return
				}
				guard response.statusCode == 200 else {
					completion(nil, .failed)
					return
				}
				
				do {
					let decoder = JSONDecoder()
					let userData = try decoder.decode(Lotto.self, from: data)
					completion(userData, nil)
				} catch {
					completion(nil, .invalidData)
				}
			}
		}.resume()
		
		
	}
	
	static func person(_ text: String, page: Int, completion: @escaping (Person?, APIError?) -> Void) {
		let scheme = "https"
		let host = "api.themoviedb.org"
		let path = "/3/search/person"
		
		let key = "1ccde78f4677c971965c4a218e671f0a"
		let lagnguaue = "ko-KR"
		let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
		
		var component = URLComponents()
		component.scheme = scheme
		component.host = host
		component.path = path
		component.queryItems = [
			URLQueryItem(name: "api_key", value: key),
			URLQueryItem(name: "language", value: lagnguaue),
			URLQueryItem(name: "query", value: query),
			URLQueryItem(name: "page", value: "\(page)")
		]
		
		print(component.url!)
		URLSession.shared.dataTask(with: component.url!) { data, response, error in
			print(data,response,error)
			DispatchQueue.main.async {
				guard error == nil else {
					completion(nil, .failed)
					return
				}
				guard let data = data else {
					completion(nil, .noData)
					return
				}
				guard let response = response as? HTTPURLResponse else {
					completion(nil, .invalidResponse)
					return
				}
				guard response.statusCode == 200 else {
					completion(nil, .failed)
					return
				}
				
				do {
					let decoder = JSONDecoder()
					let userData = try decoder.decode(Person.self, from: data)
					completion(userData, nil)
				} catch {
					completion(nil, .invalidData)
				}
				
			}
			
		}.resume()
		
		
	}
}

