//
//  MeNormalCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/12.
//

import UIKit

class MeNormalCell: UITableViewCell {
    
    static let nibName = "MeNormalCell"
    static let reUsedKey = "MeNormalCell.key"

    // Data
    public var title: String? {
        didSet{
            p_updateUI()
        }
    }
    
    // UI
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
    }

  
    fileprivate func p_updateUI(){
        cellTitleLabel.text = title
    }
    
}
