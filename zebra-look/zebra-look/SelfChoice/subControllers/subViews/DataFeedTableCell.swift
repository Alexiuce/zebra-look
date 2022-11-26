//
//  DataFeedTableCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/26.
//

import UIKit

class DataFeedTableCell: UITableViewCell {
    
    
    
    static let nibName = "DataFeedTableCell"
    static let reUsedKey = "DataFeedTableCell.key"

    
    // Data
    
    // UI
    
    
    
    @IBOutlet weak var containerView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 7.5
    }

 
    
}
