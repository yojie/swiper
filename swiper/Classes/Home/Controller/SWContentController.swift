//
//  SWContentController.swift
//  swiper
//
//  Created by Jai on 2018/7/16.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWContentController: NSObject {
	var contents: Array<SWContentModel>?
	var page: Int = 0
	var callback: ((_ callback: Array<SWContentModel>?) -> Void)?
	
	
	func fetch(block: ((_ block: Array<SWContentModel>?) -> Void)?) {
		self.callback = block
	}
}

























































