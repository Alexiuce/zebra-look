//
//  ChoiceItemCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/24.
//

import UIKit

class ChoiceItemCell: UICollectionViewCell {
    
    static let nibName = "ChoiceItemCell"
    static let reUsedKey = "ChoiceItemCell.key"
    
    
    
    
    
    
    // Data
    
    
    // UI
    
    @IBOutlet weak var containerView: UIView!
    
    // life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 13
        
    }

}
