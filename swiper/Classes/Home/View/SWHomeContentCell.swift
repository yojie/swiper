//
//  SWHomeContentCell.swift
//  swiper
//
//  Created by Jai on 2018/7/12.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

let sw_dimmerHomeCellAvatar: CGFloat = 25.0

class SWHomeContentCell: UICollectionViewCell {
	
	// MARK: - var
	lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = UIViewContentMode.scaleAspectFill
		imageView.backgroundColor = UIColor.textColor
		imageView.layer.cornerRadius = sw_dimmerHomeCellAvatar*0.5
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var nameLabel: UILabel = {
		let nameLabel = UILabel.label(ofText: nil, color: UIColor.textColor, font: UIFont.textFont())
		nameLabel.backgroundColor = UIColor.contentBackgroundColor
		nameLabel.textAlignment = NSTextAlignment.left
		return nameLabel
	}()
	
	lazy var contentLabel: UILabel = {
		let contentLabel = UILabel.label(ofText: nil, color: UIColor.textColor, font: UIFont.contentFont())
		contentLabel.textAlignment = NSTextAlignment.left
		contentLabel.numberOfLines = 0
		contentLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
		return contentLabel
	}()
	
	lazy var itemController: SWHomeItemController = {
		let itemController = SWHomeItemController.init()
		return itemController
	}()
	
	// MARK: - init
	override func awakeFromNib() {
		super.awakeFromNib()
		self.sw_setup()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.sw_setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - setup
	func sw_setup() {
		self.sw_setupViews()
	}
	
	func sw_setupViews() {
		self.contentView.backgroundColor = UIColor.contentBackgroundColor
		self.contentView.addSubview(self.imageView)
		self.contentView.addSubview(self.nameLabel)
		self.contentView.addSubview(self.contentLabel)
		self.contentView.addSubview(self.itemController.mainScrollView)
	}
	
    // MARK: - layout
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.imageView.frame = CGRect(x: sw_margin, y: sw_margin, width: sw_dimmerHomeCellAvatar, height: sw_dimmerHomeCellAvatar)
		self.nameLabel.frame = CGRect(x: sw_dimmerHomeCellAvatar+sw_margin*2, y: sw_margin, width: self.width-sw_dimmerHomeCellAvatar-sw_margin*3, height: sw_dimmerHomeCellAvatar)
		self.contentLabel.frame = CGRect(x: sw_margin, y: self.nameLabel.bottom+sw_margin, width: self.width-sw_margin*2, height: 15)
		
		self.contentLabel.sizeToFit()
		
		let width = self.width-sw_margin*2
		self.itemController.mainScrollView.frame = CGRect(x: sw_margin, y: sw_margin+self.contentLabel.bottom, width: width, height: self.height-sw_margin*2-self.contentLabel.bottom)
	}
}
























































