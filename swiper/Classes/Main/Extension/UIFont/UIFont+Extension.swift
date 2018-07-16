//
//  UIFont+Extension.swift
//  swiper
//
//  Created by Jai on 2018/7/12.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

extension UIFont {
	class func sw_font(ofSize fontSize: CGFloat) -> UIFont {
		return UIFont.systemFont(ofSize: fontSize)
	}
	
	class func sw_blodFont(ofSize fontSize: CGFloat) -> UIFont {
		return UIFont.boldSystemFont(ofSize: fontSize)
	}
	
	class func textFont() -> UIFont {
		return UIFont.sw_font(ofSize: 15.0)
	}
	
	class func contentFont() -> UIFont {
		return UIFont.sw_font(ofSize: 13.0)
	}
}
























































