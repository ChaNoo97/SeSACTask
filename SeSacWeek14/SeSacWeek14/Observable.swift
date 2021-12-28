//
//  Observable.swift
//  SeSacWeek14
//
//  Created by Hoo's MacBookPro on 2021/12/27.
//

import Foundation

class Observable<T> {
	
	private var listener: ((T) -> Void)?
	
	var value: T {
		didSet {
			listener?(value)
		}
	}
	
	init(_ value: T) {
		self.value = value
	}
	
	func bind(_ closure: @escaping (T) -> Void) {
		closure(value)
		listener = closure
	}
}

class User1 {
	var name: String {
		didSet {
			printself()
		}
	}
	
	init(_ name: String) {
		self.name = name
	}
	
	func printself() {
		print("dkdk")
	}
}



