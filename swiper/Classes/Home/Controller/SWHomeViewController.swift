//
//  SWHomeViewController.swift
//  swiper
//
//  Created by Jai on 2018/7/11.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWHomeViewController: SWBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	// MARK: - vars
	lazy var mainCollectionView: UICollectionView = {
		let layout = UICollectionViewLayout.init()
		var collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.backgroundColor = self.view.backgroundColor
		collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
		collectionView.alwaysBounceVertical = true
		if #available(iOS 11.0, *) {
			collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
		}
		return collectionView
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
	
	// MARK: - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize.zero
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}



















































