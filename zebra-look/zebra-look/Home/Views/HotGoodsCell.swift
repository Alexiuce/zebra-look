//
//  HotGoodsCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/8.
//  热门商品

import UIKit

class HotGoodsCell: UITableViewCell {

    static let nibName = "HotGoodsCell"
    static let reUsedKey = "HotGoodsCell.key"
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        
        let gnib = UINib.init(nibName: HotCollectionCell.nibName, bundle: nil)
        collectionView.register(gnib, forCellWithReuseIdentifier: HotCollectionCell.reUsedKey)
    
        
        flowLayout.itemSize = CGSize(width: 166, height: 75)
    }

}

// MARK:
extension HotGoodsCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotCollectionCell.reUsedKey, for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
}
