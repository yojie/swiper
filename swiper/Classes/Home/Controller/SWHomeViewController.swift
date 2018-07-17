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
		let layout = UICollectionViewFlowLayout.init()
		var collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.delegate = self
		collectionView.dataSource = self
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
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.dataController.contents.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: SWHomeContentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SWHomeContentCell", for: indexPath) as! SWHomeContentCell
		let model = self.dataController.contents[indexPath.row] as SWContentModel
		cell.nameLabel.text = model.poster?.name
		cell.contentLabel.text = model.content
		cell.itemController.isImage = model.isImage
		cell.itemController.items = model.medias
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let model = self.dataController.contents[indexPath.row] as SWContentModel
		return CGSize(width: collectionView.width, height: model.height(fromWidth: collectionView.width))
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets.zero
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 1.0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	// MARK: - fetch
	func sw_fetch() {
		self.dataController.fetch { (success) in
		}
	}
}



















































