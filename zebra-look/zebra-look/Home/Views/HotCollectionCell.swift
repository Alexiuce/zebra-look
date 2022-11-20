//
//  HotCollectionCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/9.
//

import UIKit

class HotCollectionCell: UICollectionViewCell {

    static let nibName = "HotCollectionCell"
    static let reUsedKey = "HotCollectionCell.key"
    
    
    
    @IBOutlet weak var containerView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 7.5
        containerView.layer.masksToBounds = true
    }

}
