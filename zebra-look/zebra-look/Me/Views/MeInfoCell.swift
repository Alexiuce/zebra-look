//
//  MeInfoCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/12.
//

import UIKit

class MeInfoCell: UITableViewCell {

    
    static let nibName = "MeInfoCell"
    static let reUsedKey = "MeInfoCell.key"
    
    
    
    // UI
    
    @IBOutlet weak var containerView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }

 
    
}
