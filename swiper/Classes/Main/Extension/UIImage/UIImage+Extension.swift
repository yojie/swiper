//
//  UIImage+Extension.swift
//  swiper
//
//  Created by Jai on 2018/7/19.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

extension UIImage {
	
	class func image(fromText text: NSString?, size: CGSize, backgroundColor: UIColor?, textColor: UIColor?, font: UIFont) -> UIImage? {
		guard text != nil else {
			return nil;
		}
		UIGraphicsBeginImageContextWithOptions(size, false, sw_screenScale)
		
		let content = UIGraphicsGetCurrentContext()
		
		backgroundColor?.setFill()
		
		let radius = (min(size.width, size.height)-2.0)/2.0;
		content?.addArc(center: CGPoint.init(x: radius, y: radius), radius: radius, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: false)
		content?.fillPath()
		
		let style: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
		style.alignment = .center
		
		let textSize = text?.boundingRect(with: size, options: [.usesFontLeading, .truncatesLastVisibleLine], attributes: [.font: font], context: nil).size
		
		text?.draw(in: CGRect.init(origin: CGPoint.init(x: 0, y: (size.height-(textSize?.height)!)*0.5), size: size),
				   withAttributes: [.font : font,
									.paragraphStyle: style,
									.foregroundColor: textColor!])
		
		let image = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return image
	}
	
	class func image(withFileName fileName: String?) -> UIImage? {
		guard fileName != nil else {
			return nil
		}
		var path: NSString = NSString.init(string: Overall.imagePath)
		path = path.appendingPathComponent(fileName!) as NSString
		let image = UIImage.init(contentsOfFile: path as String)
		return image
	}
	
	func save(toPath path: String?) -> Void {
		let mPath = NSMutableString.init(string: Overall.imagePath)
		let data: Data = UIImagePNGRepresentation(self)!
		let fileMgr = FileManager.default
		let writed = fileMgr.createFile(atPath: mPath.appendingPathComponent(path!), contents: data, attributes: nil)
		Log.debug("writed[\(writed)]: \(path!)")
	}
}

























































