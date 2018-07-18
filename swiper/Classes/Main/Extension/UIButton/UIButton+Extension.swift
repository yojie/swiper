//
//  UIButton+Extension.swift
//  swiper
//
//  Created by Jai on 2018/7/18.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

extension UIButton {
	// MARK: - creater
	class func create(withTitle title: String?, highlight: String?, font: UIFont?, target: Any?, action: Selector?) -> UIButton {
		let button = UIButton(type: UIButtonType.custom)
		button.setTitle(title, for: UIControlState.normal)
		button.setTitle(highlight, for: UIControlState.highlighted)
		button.titleLabel?.font = font
		button.addTarget(target, action: action!, for: UIControlEvents.touchUpInside)
		return button
	}
	
	class func create(withImage image: UIImage?, highlight: UIImage?, target: Any?, action: Selector?) -> UIButton {
		let button = UIButton(type: UIButtonType.custom)
		button.setImage(image, for: UIControlState.normal)
		button.setImage(highlight, for: UIControlState.highlighted)
		button.addTarget(target, action: action!, for: UIControlEvents.touchUpInside)
		return button
	}
	
	class func create(withImageName imageName: String?, highlightName: String?, target: Any?, action: Selector?) -> UIButton {
		return UIButton.create(withImage: UIImage.init(named: imageName!),
							   highlight: UIImage.init(named: highlightName!),
							   target: target,
							   action: action)
	}
	
	class func create(withTitle title: String?, highlight: String?, font: UIFont?, backgroundImage: UIImage?, backgroundHighlight: UIImage?, target: Any?, action: Selector?) -> UIButton {
		let button = UIButton.create(withTitle: title, highlight: highlight, font: font, target: target, action: action)
		button.setBackgroundImage(backgroundImage, for: UIControlState.normal)
		button.setBackgroundImage(backgroundHighlight, for: UIControlState.highlighted)
		return button
	}
	
	class func create(withTitle title: String?, highlight: String?, font: UIFont?, backgroundImageName: String?, backgroundHighlightName: String?, target: Any?, action: Selector?) -> UIButton {
		return UIButton.create(withTitle: title,
							   highlight: highlight,
							   font: font,
							   backgroundImage: UIImage.init(named: backgroundImageName!),
							   backgroundHighlight: UIImage.init(named: backgroundHighlightName!),
							   target: target,
							   action: action)
	}
}

























































