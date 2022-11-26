//
//  CategoryHeadView.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/26.
//

import UIKit

class CategoryHeadView: UIView {


    // Data
    
    
    // UI
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var imgView: UIImageView!
    
    // Layout
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 13
        
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = true
        
        let nib = UINib(nibName: CategoryCollectionCell.nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CategoryCollectionCell.reUsedKey)
        
    }
    
    
    static func loadXibView() -> CategoryHeadView {
        
        let view = Bundle.main.loadNibNamed("CategoryHeadView", owner: nil)?.first as! CategoryHeadView
        return view
    }
}
extension CategoryHeadView: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.reUsedKey, for: indexPath) as! CategoryCollectionCell
        
        
        cell.isUpstream = indexPath.item == 0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let iw = indexPath.item == 0 ? 148 : 134
        
        return CGSize(width: iw, height: 82)
    }
    
}

