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
    
    // Data
    var cellData: HotGoodsData? {
        didSet {
            updateUI()
        }
    }
    
    // UI
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 7.5
        containerView.layer.masksToBounds = true
    }
    
    fileprivate func updateUI(){
        nameLabel.text = cellData?.name
        infoLabel.text = cellData?.intro
        priceLabel.text = cellData?.range
    }

}
