//
//  SWConst.swift
//  swiper
//
//  Created by Jai on 2018/7/11.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

@_exported import SnapKit

public let sw_screenWidth = UIScreen.main.bounds.size.width
public let sw_screenHeight = UIScreen.main.bounds.size.height
public let sw_screenScale = UIScreen.main.scale

public let sw_margin: CGFloat = 15.0
public let sw_lineHeight: CGFloat = 1.0

public struct Log {
	static func debug<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
		#if DEBUG
			let fileName = (file as NSString).lastPathComponent
			let endIndex = fileName.index(of: ".")
			let date = NSDate()
			print("[\(date)] 文件：\(fileName.prefix(upTo: endIndex!)) 行号：\(line) 函数：\(function)\n|-> \(message)")
		#endif
	}
}





























































