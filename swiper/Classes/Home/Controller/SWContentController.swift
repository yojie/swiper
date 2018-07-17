//
//  SWContentController.swift
//  swiper
//
//  Created by Jai on 2018/7/16.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWContentController: NSObject {
	// MARK: - var
	var contents: Array<SWContentModel> = Array()
	var page: Int = 0
	var callback: ((_ callback: Bool) -> Void)?
	
	// MARK: - init
	override init() {
		super.init()
		
		let model: SWContentModel = SWContentModel()
		model.poster = SWUserModel()
		model.poster?.name = "Swiper"
		model.content = "Flat UI Colors 2 features 13 more color palettes. Collaborating with 13 designers around the world, a total set of 280 colors are on your command for COPY / PASTE for your next project, design, presentation."
		model.isImage = true
		self.contents.append(model)
		
		for _ in 0..<2 {
			model.medias.append("test")
		}
		
		for _ in 1..<20 {
			self.contents.append(model.copy() as! SWContentModel)
		}
	}
	
	// MARK: - fetch
	func fetch(block: ((_ block: Bool) -> Void)?) {
		self.callback = block
		if self.callback != nil {
			self.callback!(true)
		}
	}
}

























































