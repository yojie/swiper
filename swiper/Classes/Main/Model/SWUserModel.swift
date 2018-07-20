//
//  SWUserModel.swift
//  swiper
//
//  Created by Jai on 2018/7/16.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

public class SWUserModel: NSObject, NSCoding {
	
	// MARK: - var
	var avatar: String?
	var name: String?
	
	// MARK: - func
	class func createLocal() -> SWUserModel {
		let model = SWUserModel()
		
		model.name = UIDevice.current.name;
		let prefix = model.name?.prefix(upTo: (model.name?.index((model.name?.startIndex)!, offsetBy: 1))!)
		let dimmer: CGFloat = 128.0;
		let image = UIImage.image(fromText: prefix! as NSString, size: CGSize.init(width: dimmer, height: dimmer), backgroundColor: UIColor.textColor, textColor: UIColor.contentBackgroundColor, font: UIFont.sw_font(ofSize: dimmer*0.75))
		model.avatar = Date.todayToString()
		image?.save(toPath: model.avatar!)
		model.update()
		
		return model
	}
	func update() -> Void {
		let data = NSKeyedArchiver.archivedData(withRootObject: self)
		UserDefaults.standard.set(data, forKey: OAKeyUser)
		UserDefaults.standard.synchronize()
	}
	
	override init() {
		super.init()
	}
	
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(self.avatar, forKey: "avatar")
		aCoder.encode(self.name, forKey: "name")
	}
	
	public required init?(coder aDecoder: NSCoder) {
		self.avatar = (aDecoder.decodeObject(forKey: "avatar") as! String)
		self.name = (aDecoder.decodeObject(forKey: "name") as! String)
	}
}

























































