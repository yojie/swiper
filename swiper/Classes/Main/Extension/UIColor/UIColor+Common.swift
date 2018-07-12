//
//  UIColor+Common.swift
//  swiper
//
//  Created by Jai on 2018/7/11.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

extension UIColor {
	convenience init(hex: UInt, alpha: CGFloat) {
		self.init(
			red: 	CGFloat((hex & 0xff0000) >> 16) / 255.0,
			green:	CGFloat((hex & 0x00ff00) >> 8 ) / 255.0,
			blue:	CGFloat((hex & 0x0000ff) >> 0 ) / 255.0,
			alpha: 	alpha
		)
	}
	class var mainToneColor: UIColor {
		return UIColor(white: 0.6, alpha: 1.0)
	}
	class var auxiliaryColor: UIColor {
		return UIColor.groupTableViewBackground
	}
	class var textColor: UIColor {
		return UIColor.mainToneColor
	}
	class var backgroundColor: UIColor {
		return UIColor.black
	}
}
