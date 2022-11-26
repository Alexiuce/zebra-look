//
//  HotDataTagCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/24.
//

import UIKit

class HotDataTagCell: UITableViewCell {
    
    
    static let nibName = "HotDataTagCell"
    static let reUsedKey = "HotDataTagCell.key"
    
    // Data
    
    
    // UI
    
    @IBOutlet weak var bgLeftView: UIView!
    @IBOutlet weak var bgRightView: UIView!
    
    // Layout

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgLeftView.layer.cornerRadius = 17
        bgRightView.layer.cornerRadius = 17
    }

 
    
}
