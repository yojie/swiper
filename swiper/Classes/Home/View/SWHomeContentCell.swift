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
		var imageView = UIImageView()
		imageView.contentMode = UIViewContentMode.scaleAspectFill
		imageView.backgroundColor = UIColor.auxiliaryColor
		imageView.layer.cornerRadius = sw_dimmerHomeCellAvatar*0.5
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var nameLabel: UILabel = {
		var nameLabel = UILabel.label(ofText: nil, color: UIColor.textColor, font: UIFont.textFont())
		nameLabel.backgroundColor = UIColor.contentBackgroundColor
		nameLabel.textAlignment = NSTextAlignment.left
		return nameLabel
	}()
	
	lazy var contentLabel: UILabel = {
		var contentLabel = UILabel.label(ofText: nil, color: UIColor.textColor, font: UIFont.contentFont())
		contentLabel.textAlignment = NSTextAlignment.left
		contentLabel.numberOfLines = 0
		contentLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
		return contentLabel
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
//		self.sw_setupConstraints()
	}
	
	func sw_setupViews() {
		self.contentView.backgroundColor = UIColor.contentBackgroundColor
		self.contentView.addSubview(self.imageView)
		self.contentView.addSubview(self.nameLabel)
		self.contentView.addSubview(self.contentLabel)
	}
	
	func sw_setupConstraints() {
		weak var wself = self
		self.imageView.snp.makeConstraints { (make) in
			make.size.equalTo(CGSize(width: sw_dimmerHomeCellAvatar, height: sw_dimmerHomeCellAvatar))
			make.left.top.equalTo(sw_margin)
		}
		self.nameLabel.snp.makeConstraints { (make) in
			make.top.equalTo(sw_margin)
			make.left.equalTo((wself?.imageView.snp.right)!).offset(sw_margin)
			make.right.equalToSuperview().offset(-sw_margin)
			make.height.equalTo(sw_dimmerHomeCellAvatar)
		}
	}
    // MARK: - layout
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.imageView.frame = CGRect(x: sw_margin, y: sw_margin, width: sw_dimmerHomeCellAvatar, height: sw_dimmerHomeCellAvatar)
		self.nameLabel.frame = CGRect(x: sw_dimmerHomeCellAvatar+sw_margin*2, y: sw_margin, width: self.width-sw_dimmerHomeCellAvatar-sw_margin*3, height: sw_dimmerHomeCellAvatar)
		self.contentLabel.frame = CGRect(x: sw_margin, y: self.nameLabel.bottom+sw_margin, width: self.width-sw_margin*2, height: 15)
		
		self.contentLabel.sizeToFit()
	}
}
























































