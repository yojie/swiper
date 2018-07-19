//
//  Date+Extension.swift
//  swiper
//
//  Created by Jai on 2018/7/19.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

extension Date {
	
	static func todayToString() -> String {
		let date = Date()
		return date.dateToString()
	}
	
	func dateToString() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd_HH:mm:ss"
		return formatter.string(from: self)
	}

}
























































