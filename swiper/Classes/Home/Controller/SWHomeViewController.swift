//
//  SWHomeViewController.swift
//  swiper
//
//  Created by Jai on 2018/7/11.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWHomeViewController: SWBaseViewController {
	
	// MARK: - vars
	lazy var mainCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout.init()
		var collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.delegate = self.dataController
		collectionView.dataSource = self.dataController
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.backgroundColor = UIColor.scrollViewBackgroundColor
		collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
		collectionView.alwaysBounceVertical = true
		collectionView.scrollIndicatorInsets = UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
		collectionView.register(SWHomeContentCell.self, forCellWithReuseIdentifier: "SWHomeContentCell")
		if #available(iOS 11.0, *) {
			collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
		}
		return collectionView
	}()
	
	lazy var dataController: SWContentController = {
		let dataController = SWContentController()
		return dataController
	}()

	// MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.sw_setup()
    }
	
	// MARK: - setup
	func sw_setup() {
		self.sw_setupVariables()
		self.sw_setupViews()
		self.sw_setupConstraints()
	}
	
	func sw_setupVariables() {
		self.mTitle = "SWIPER"
	}
	
	func sw_setupViews() {
		self.view.addSubview(self.mainCollectionView)
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(self.sw_didTapAddAction(sender:)))
	}
	
	func sw_setupConstraints() {
		self.mainCollectionView.snp.makeConstraints { (make) in
			make.left.right.equalToSuperview()
			if #available(iOS 11.0, *) {
				make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
				make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
			}
			else {
				make.top.bottom.equalToSuperview()
			}
		}
	}
	
	// MARK: - actions
	@objc func sw_didTapAddAction(sender: Any) {
	}
}



















































