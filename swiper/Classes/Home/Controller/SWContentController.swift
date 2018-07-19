//
//  SWContentController.swift
//  swiper
//
//  Created by Jai on 2018/7/16.
//  Copyright © 2018年 Jai Chow. All rights reserved.
//

import UIKit

class SWContentController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	// MARK: - var
	var contents: Array<SWContentModel> = Array()
	var page: Int = 0
	var callback: ((_ callback: Bool) -> Void)?
	
	// MARK: - init
	override init() {
		super.init()
		
		let model: SWContentModel = SWContentModel()
		model.poster = Overall.user
		model.content = "Flat UI Colors 2 features 13 more color palettes. Collaborating with 13 designers around the world, a total set of 280 colors are on your command for COPY or PASTE for your next project, design, presentation."
		model.isImage = true
		self.contents.append(model)
		
//		for _ in 0..<2 {
//			model.medias.append("test")
//		}
		
		for _ in 1..<20 {
			self.contents.append(model.copy() as! SWContentModel)
		}
	}
	
	// MARK: - fetch
	func fetch(block: ((_ block: Bool) -> Void)?) {
		self.callback = block
		if self.callback != nil {
			self.callback!(true)
		}
	}
	
	// MARK: - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.contents.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: SWHomeContentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SWHomeContentCell", for: indexPath) as! SWHomeContentCell
		let model = self.contents[indexPath.row] as SWContentModel
		cell.nameLabel.text = model.poster?.name
		cell.contentLabel.text = model.content
		cell.itemController.isImage = model.isImage
		cell.itemController.items = model.medias
		cell.imageView.image = UIImage.image(withFileName: model.poster?.avatar)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let model = self.contents[indexPath.row] as SWContentModel
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
}

























































