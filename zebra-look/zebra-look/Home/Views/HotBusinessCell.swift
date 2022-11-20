//
//  HotBusinessCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/8.
//  热门行业

import UIKit

class HotBusinessCell: UITableViewCell {

    static let nibName = "HotBusinessCell"
    static let reUsedKey = "HotBusinessCell.key"
    
    
    @IBOutlet weak var containerView: ZBGradientView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        
        let gnib = UINib.init(nibName: BusinessCollectionViewCell.nibName, bundle: nil)
        collectionView.register(gnib, forCellWithReuseIdentifier: BusinessCollectionViewCell.reUsedKey)
        flowLayout.itemSize = CGSize(width: 108, height: 123)
        
        // 设置渐变色
        let cls = [UIColor.white.cgColor, UIColor(named: "viewBgColor")!.cgColor]
        containerView.gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        containerView.gradientLayer.endPoint =  CGPoint(x: 0.5, y: 1)
        containerView.gradientLayer.colors = cls
        
    }

    
    
}

// MARK:
extension HotBusinessCell : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BusinessCollectionViewCell.reUsedKey, for: indexPath)
        return cell
    }
  
    
}
