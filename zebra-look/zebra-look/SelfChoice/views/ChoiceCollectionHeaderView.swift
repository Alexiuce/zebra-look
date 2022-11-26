//
//  ChoiceCollectionHeaderView.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/24.
//

import UIKit






class ChoiceCollectionHeaderView: UICollectionReusableView {
    
    static let nibName = "ChoiceCollectionHeaderView"
    static let reUsedKey = "ChoiceCollectionHeaderView.key"

    
    
    // Data
    
    // UI
    
    @IBOutlet weak var firstImgView: UIImageView!
    @IBOutlet weak var hotDataContainerView: UIView!
    
    @IBOutlet weak var categoryContainerView: UIView!
    
    @IBOutlet weak var ourContainerView: UIView!
    
    
    @IBOutlet weak var goodContainerView: UIView!
    // Layout
    @IBOutlet weak var secondImgView: UIImageView!
    
    
    // Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let radius:CGFloat = 13
        ourContainerView.layer.cornerRadius = radius
        hotDataContainerView.layer.cornerRadius = radius
        categoryContainerView.layer.cornerRadius = radius
        
        firstImgView.layer.cornerRadius = radius
        secondImgView.layer.cornerRadius = radius
        
        goodContainerView.layer.cornerRadius = radius
        goodContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    @IBAction func clickedHotData(_ sender: UIButton) {
        
        print("button clicked",sender.tag)
        
        ChoiceCoordiantor.share.showHotDataPage()
        
    }
}
