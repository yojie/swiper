//
//  SWNavigationController.swift
//  swiper
//
//  Created by Jai on 2018/7/11.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		self.navigationBar.tintColor = UIColor.textColor
		self.navigationBar.barTintColor = UIColor.backgroundColor
		self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.textColor]
		self.navigationBar.shadowImage = UIImage()
		
		self.navigationBar.barStyle = UIBarStyle.default
    }
	
	override var shouldAutorotate: Bool {
		return (self.visibleViewController?.shouldAutorotate)!;
	}
	
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return (self.visibleViewController?.supportedInterfaceOrientations)!;
	}
	
	override var prefersStatusBarHidden: Bool {
		return (self.visibleViewController?.prefersStatusBarHidden)!
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return (self.visibleViewController?.preferredStatusBarStyle)!
	}

}






















































