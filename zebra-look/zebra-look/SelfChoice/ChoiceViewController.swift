//
//  ChoiceViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/23.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    
    // Data
    
    
    
    // UI
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // Layout

    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var topViewHeightLayout: NSLayoutConstraint!
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "发现"
        
        topViewHeightLayout.constant = view.safeAreaInsets.top
        ChoiceCoordiantor.share.navController = navigationController
        
        let cnib = UINib(nibName: ChoiceItemCell.nibName, bundle: nil)
        collectionView.register(cnib, forCellWithReuseIdentifier: ChoiceItemCell.reUsedKey)
        let hnib = UINib(nibName: ChoiceCollectionHeaderView.nibName, bundle: nil)
        collectionView.register(hnib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChoiceCollectionHeaderView.reUsedKey)
        
        let cw = (UIScreen.main.bounds.width - 10 - 16 * 2) * 0.5
        collectionLayout.itemSize = CGSize(width: cw, height: 75)
    
    }
    
}


extension ChoiceViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoiceItemCell.reUsedKey, for: indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChoiceCollectionHeaderView.reUsedKey, for: indexPath)
            return view
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 1077)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ChoiceCoordiantor.share.showCategoryPage()
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 0 {
            topViewHeightLayout.constant = view.safeAreaInsets.top
            return
        }
        topViewHeightLayout.constant = view.safeAreaInsets.top + abs(offsetY)
    }
    
    
}


