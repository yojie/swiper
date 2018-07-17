//
//  UIView+Extension.swift
//  swiper
//
//  Created by Jai on 2018/7/12.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

extension UIView {
	// MARK: - var
	var x: CGFloat {
		get {
			return self.frame.origin.x
		}
		set {
			self.frame = CGRect(origin: CGPoint.init(x: newValue, y: self.frame.origin.y), size: self.frame.size)
		}
	}
	
	var y: CGFloat {
		get {
			return self.frame.origin.y
		}
		set {
			self.frame = CGRect(origin: CGPoint.init(x: self.frame.origin.x, y: newValue), size: self.frame.size)
		}
	}
	
	var width: CGFloat {
		get {
			return self.frame.size.width
		}
		set {
			self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: newValue, height: self.frame.size.height))
		}
	}
	
	var height: CGFloat {
		get {
			return self.frame.size.height
		}
		set {
			self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: self.frame.size.width, height: newValue))
		}
	}
	
	var right: CGFloat {
		get {
			return self.x+self.width
		}
		set {
			self.frame = CGRect(origin: CGPoint.init(x: newValue-self.width, y: self.frame.origin.y), size: self.frame.size)
		}
	}
	
	var bottom: CGFloat {
		get {
			return self.y+self.height
		}
		set {
			self.frame = CGRect(origin: CGPoint.init(x: self.frame.origin.x, y: newValue-self.height), size: self.frame.size)
		}
	}
	
	// MARK: - animation
	func sw_fade() {
		let animation = CATransition()
		animation.type = kCATransitionFade
		animation.duration = 0.25
		self.layer.add(animation, forKey: "fade")
	}
	
	// MARK: - subviews
	func sw_removeSubviews() {
		for subview in self.subviews {
			subview.removeFromSuperview()
		}
	}
	
	func sw_removeSubviews(fromTag tag: Int) {
		for subview in self.subviews {
			guard subview.tag >= tag else {
				continue
			}
			subview.removeFromSuperview()
		}
	}
}

























































