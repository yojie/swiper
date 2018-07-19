//
//  SWOverall.swift
//  swiper
//
//  Created by Jai on 2018/7/19.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

private let OARootName = "Overall"
private let OAImagePath = "images"
private let OAVideoPath = "videos"

public class SWOverall: NSObject {
	// MARK: - var
	var user: SWUserModel {
		get {
			let data = UserDefaults.standard.object(forKey: OAKeyUser)
			var user: SWUserModel?
			if data == nil {
				user = SWUserModel.createLocal()
			}
			else {
				user = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as? SWUserModel;
			}
			return user!
		}
	}
	
	private var _rootPath: String?
	var rootPath: String {
		guard _rootPath == nil else {
			return _rootPath!
		}
		
		let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
		let mPath = NSMutableString.init(string: path!)
		_rootPath = mPath.appendingPathComponent(OARootName) as String
		
		self.sw_createDirectory(atPath: _rootPath)
		
		return _rootPath!
	}
	
	private var _imagePath: String?
	var imagePath: String {
		guard _imagePath == nil else {
			return _imagePath!
		}
		
		let mPath = NSMutableString.init(string: self.rootPath)
		_imagePath = mPath.appendingPathComponent(OAImagePath) as String
		
		self.sw_createDirectory(atPath: _imagePath)
		
		return _imagePath!
	}
	
	private var _videoPath: String?
	var videoPath: String {
		guard _videoPath == nil else {
			return _videoPath!
		}
		
		let mPath = NSMutableString.init(string: self.rootPath)
		_videoPath = mPath.appendingPathComponent(OAVideoPath) as String
		
		self.sw_createDirectory(atPath: _videoPath)
		
		return _videoPath!
	}
	
	// MARK: - func
	private func sw_createDirectory(atPath path: String?) -> Void {
		let fileManager = FileManager.default
		if fileManager.fileExists(atPath: path!) == false {
			do {
				try fileManager.createDirectory(atPath: path!, withIntermediateDirectories: true, attributes: nil)
			}
			catch {
				Log.debug(error)
			}
		}
	}
}

























































