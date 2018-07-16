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
		var nameLabel = UILabel()
		nameLabel.textColor = UIColor.textColor
		nameLabel.backgroundColor = UIColor.contentBackgroundColor
		nameLabel.textAlignment = NSTextAlignment.left
		nameLabel.font = UIFont.textFont()
		return nameLabel
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
		self.sw_setupConstraints()
	}
	
	func sw_setupViews() {
		self.contentView.backgroundColor = UIColor.contentBackgroundColor
		self.contentView.addSubview(self.imageView)
		self.contentView.addSubview(self.nameLabel)
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
    
}
























































