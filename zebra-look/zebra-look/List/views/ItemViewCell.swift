//
//  ItemViewCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/6.
//

import UIKit

class ItemViewCell: UITableViewCell {
    
    
    static let nibName = "ItemViewCell"
    static let reUsedKey = "ItemViewCell.key"
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
