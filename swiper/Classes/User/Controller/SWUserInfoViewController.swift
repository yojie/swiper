//
//  SWUserInfoViewController.swift
//  swiper
//
//  Created by Jai on 2018/7/19.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWUserInfoViewController: SWBaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	// MARK: - var
	lazy var imageView: UIImageView = {
		let imageView = UIImageView.init(image: UIImage.image(withFileName: Overall.user.avatar!))
		imageView.isUserInteractionEnabled = true
		return imageView
	}()
	
	lazy var nameLabel: UILabel = {
		let nameLabel = UILabel.label(ofText: Overall.user.name!, color: UIColor.textColor, font: UIFont.sw_blodFont(ofSize: 17))
		nameLabel.textAlignment = NSTextAlignment.center
		return nameLabel
	}()

	// MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.sw_setup()
    }
	
	// MARK: - setup
	func sw_setup() {
		self.sw_setupViews()
		self.sw_setupConstraints()
	}
	
	func sw_setupViews() {
		self.mTitle = "Mine".localized()
		
		self.view.addSubview(self.imageView)
		self.view.addSubview(self.nameLabel)
		
		let tapgr: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self.sw_didTapRecognized(sender:)))
		self.imageView.addGestureRecognizer(tapgr)
	}
	
	func sw_setupConstraints() {
		weak var wself = self
		self.imageView.snp.makeConstraints { (make) in
			make.size.equalTo(CGSize.init(width: 80, height: 80))
			make.top.equalTo((wself?.view.snp.top)!).offset(140)
			make.centerX.equalTo((wself?.view.snp.centerX)!)
		}
		self.nameLabel.snp.makeConstraints { (make) in
			make.top.equalTo((wself?.imageView.snp.bottom)!).offset(20)
			make.height.equalTo(30)
			make.left.right.equalTo(0)
		}
	}
	
	// MARK: - actions
	@objc func sw_didTapRecognized(sender: UITapGestureRecognizer) -> Void {
		guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
			return
		}
		
		let picker = UIImagePickerController()
		picker.delegate = self
		picker.sourceType = .photoLibrary
		picker.allowsEditing = true
		self.present(picker, animated: true, completion: nil)
	}
	
	// MARK: - UIImagePickerControllerDelegate
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
		self.imageView.image = image
		image.save(toPath: Overall.user.avatar!)
		picker.dismiss(animated: true, completion: nil)
	}
	
}



















































