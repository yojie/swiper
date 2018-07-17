//
//  SWContentModel.swift
//  swiper
//
//  Created by Jai on 2018/7/16.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWContentModel: NSObject, NSCopying {
	// MARK: - var
	var poster: SWUserModel?
	var content: String = ""
	var medias: Array<String> = Array()
	var isImage: Bool = true
	var comment: SWCommentModel?
	
	private var height: CGFloat = 0.0
	
	// MARK: - functions
	func copy(with zone: NSZone? = nil) -> Any {
		let model = SWContentModel()
		model.poster = self.poster
		model.content = self.content
		model.medias = self.medias
		model.isImage = self.isImage
		model.comment = self.comment
		return model
	}
	
	func height(fromWidth width: CGFloat) -> CGFloat {
		guard self.height == 0 else {
			return self.height
		}
		
		self.height = sw_dimmerHomeCellAvatar+sw_margin*2
		
		let mWidth = width-sw_margin*2
		
		if self.content.count > 0 {
			let string = self.content as NSString
			let options: NSStringDrawingOptions = [.usesFontLeading , .usesLineFragmentOrigin]
			let size = string.boundingRect(with: CGSize(width: mWidth, height: CGFloat(HUGE)),
										   options: options,
										   attributes: [NSAttributedStringKey.font: UIFont.contentFont()],
										   context: nil).size
			self.height += sw_margin + size.height
		}
		
		var count = self.medias.count
		
		if count > 9 {
			count = 9
		}
		
		if count == 1 {
			self.height += mWidth*10.0/16.0 + sw_margin
		}
		else if count > 1 {
			let padding = sw_padding, dimmer = (mWidth-padding*2)/3.0
			let cnt = CGFloat(ceil(Double(count)/3.0))
			self.height += (cnt*dimmer) + sw_margin
		}
		
		return self.height
	}
}

























































