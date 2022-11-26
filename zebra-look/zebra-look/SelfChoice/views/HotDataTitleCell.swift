//
//  HotDataTitleCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/24.
//

import UIKit

class HotDataTitleCell: UITableViewCell {
    
    
    static let nibName = "HotDataTitleCell"
    static let reUsedKey = "HotDataTitleCell.key"

    
    // UI
    @IBOutlet weak var originalLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    
    // life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        originalLabel.layer.cornerRadius = 13
        originalLabel.layer.masksToBounds = true
        containerView.layer.cornerRadius = 13
        containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }

 
    
}
