//
//  HomeBannerCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/8.
//  Banner Cell

import UIKit

class HomeBannerCell: UITableViewCell {

    
    static let nibName = "HomeBannerCell"
    static let reUsedKey = "HomeBannerCell.key"
    
    
    // UI
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: ZBPageControl!
    // Layout
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let gnib = UINib.init(nibName: BannerCollectionCell.nibName, bundle: nil)
        collectionView.register(gnib, forCellWithReuseIdentifier: BannerCollectionCell.reUsedKey)
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 85)
    }


    
}


// MARK:
extension HomeBannerCell : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionCell.reUsedKey, for: indexPath)
        return cell
    }
  
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.pageNumber
        pageControl.currentPage = pageNumber
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            let pageNumber = scrollView.pageNumber
            
            pageControl.currentPage = pageNumber
        }
    }
    
}
public extension UIScrollView {
    var pageNumber: Int {
        get { return Int(contentOffset.x / frame.size.width) }
        set { contentOffset.x = frame.size.width * CGFloat(newValue) }
    }
}
