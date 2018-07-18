//
//  SWLoginViewController.swift
//  swiper
//
//  Created by Jai on 2018/7/18.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWLoginViewController: SWBaseViewController {
	
	// MARK: - var
	var callback: ((_ success: Bool) -> Void)?
	
	// MARK: - creater
	class func createLogin(_ block: ((_ success: Bool) -> Void)?) -> UIViewController {
		let viewController = SWLoginViewController()
		let navigation = SWNavigationController(rootViewController: viewController)
		viewController.callback = block
		return navigation
	}
	
	// MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.sw_setup()
    }
	
	// MARK: - setup
	func sw_setup() {
		self.sw_setupViews()
		self.sw_setupVariables()
		self.sw_setupConstraints()
	}
	
	func sw_setupViews() {
		self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "close"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.sw_didTapCloseAction))
	}
	
	func sw_setupVariables() {
		self.mTitle = "Login"
	}
	
	func sw_setupConstraints() {
	}
	
	// MARK: - actions
	@objc func sw_didTapCloseAction() {
		if self.callback != nil {
			self.callback!(false)
		}
	}
}



















































