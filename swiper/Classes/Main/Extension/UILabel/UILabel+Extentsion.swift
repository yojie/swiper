//
//  UILabel+Extentsion.swift
//  swiper
//
//  Created by Jai on 2018/7/16.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

extension UILabel {
	// MARK: - creater
	class func label(ofText text: String?) -> UILabel {
		let label = UILabel()
		label.text = text
		label.backgroundColor = UIColor.clear
		return label
	}
	class func label(ofText text: String?, color: UIColor?) -> UILabel {
		let label = UILabel.label(ofText: text)
		label.textColor = color
		return  label
	}
	class func label(ofText text: String?, color: UIColor?, font: UIFont?) -> UILabel {
		let label = UILabel.label(ofText: text, color: color)
		label.font = font
		return  label
	}
	class func label(ofText text: String?, color: UIColor?, font: UIFont?, tag: Int) -> UILabel {
		let label = UILabel.label(ofText: text, color: color, font: font)
		label.tag = tag
		return  label
	}
	class func label(ofText text: String?, color: UIColor?, font: UIFont?, frame: CGRect) -> UILabel {
		let label = UILabel.label(ofText: text, color: color, font: font)
		label.frame = frame
		return  label
	}
	class func label(ofText text: String?, color: UIColor?, font: UIFont?, tag: Int, frame: CGRect) -> UILabel {
		let label = UILabel.label(ofText: text, color: color, font: font, tag: tag)
		label.frame = frame
		return  label
	}
	class func label(ofTag tag: Int) -> UILabel {
		let label = UILabel.label(ofText: nil)
		label.tag = tag
		return label
	}
	class func label(ofFrame frame: CGRect) -> UILabel {
		let label = UILabel.label(ofText: nil)
		label.frame = frame
		return label
	}
}
