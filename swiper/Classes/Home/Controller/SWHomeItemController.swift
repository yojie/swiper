//
//  SWHomeItemController.swift
//  swiper
//
//  Created by Jai on 2018/7/16.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWHomeItemController: NSObject {
	// MARK: - var
	private let SWTagItem: Int = 2020

	lazy var mainScrollView: UIScrollView = {
		let scrollView = UIScrollView.init()
		scrollView.showsVerticalScrollIndicator = false
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.scrollsToTop = false
		scrollView.bounces = false
		scrollView.isScrollEnabled = false
		return scrollView
	}()
	
	private var _items: Array<String> = Array()
	var items: Array<String>? {
		get {
			return _items
		}
		set {
			_items = newValue! as Array<String>
			self.sw_setupItems()
		}
	}
	
	private var _isImage: Bool?
	var isImage: Bool {
		get {
			return _isImage!
		}
		set {
			_isImage = newValue
		}
	}
	
	// MARK: - init
	deinit {
		self.mainScrollView.removeObserver(self, forKeyPath: "frame")
	}
	
	override init() {
		super.init()
		self.mainScrollView.addObserver(self, forKeyPath: "frame", options: NSKeyValueObservingOptions.new, context: nil)
	}
	
	// MARK: - observer
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		self.sw_layoutItems()
	}
	
	// MARK: - setup
	private func sw_setupItems() {
		self.mainScrollView.sw_removeSubviews()
		var idx = SWTagItem
		var count = self.items?.count
		if count! > 9 {
			count = 9
		}
		
		for i in 0..<count! {
			let item = self.items![i]
			if self.isImage {
				let imageView = UIImageView.init()
				imageView.tag = idx;
				imageView.contentMode = UIViewContentMode.scaleAspectFill
				imageView.clipsToBounds = true
				imageView.image = UIImage.init(named: item)//.init(contentsOfFile: item)
				self.mainScrollView.addSubview(imageView)
			}
			idx += 1
		}
		self.sw_layoutItems()
	}
	
	// MARK: - layout
	private func sw_layoutItems() {
		let count = self.mainScrollView.subviews.count
		guard count > 0 else {
			return
		}
		
		let idx = SWTagItem
		if count == 1 {
			let subview = self.mainScrollView.viewWithTag(idx)
			subview?.frame = self.mainScrollView.bounds
			return
		}
		
		var left: CGFloat = 0.0, top: CGFloat = 0.0
		let margin = sw_padding, width = (self.mainScrollView.width-margin*2)/3.0, height = width
		for i in 0..<count {
			let subview = self.mainScrollView.viewWithTag(idx+i)
			subview?.frame = CGRect.init(x: left, y: top, width: width, height: height)
			if (i+1)%3 == 0 {
				left = 0.0
				top += margin + height
			}
			else {
				left += margin + width
			}
		}
	}
}
























































