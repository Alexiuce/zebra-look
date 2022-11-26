//
//  CategoryCollectionCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/26.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    
    
    static let nibName = "CategoryCollectionCell"
    static let reUsedKey = "CategoryCollectionCell.key"
    
    
    // Data
    var cellData: NSObject? = nil
    
    var isUpstream = false {
        didSet {
            updateUI()
        }
    }
    
    
    // UI
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var lineView: UIView!
    // Layout
    
    @IBOutlet weak var rightPadingLayout: NSLayoutConstraint!
    
    
    // Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.backgroundColor = UIColor.clear
        containerView.layer.shadowColor = UIColor(red: 211/255.0, green: 211/255.0, blue: 211/255.0, alpha: 0.3).cgColor
        containerView.layer.shadowOffset = CGSizeMake(0,2);
        containerView.layer.shadowOpacity = 1;
        containerView.layer.shadowRadius = 3;
        containerView.layer.cornerRadius = 7.5;
        lineView.isHidden = true
    }
    
    fileprivate func updateUI(){
        lineView.isHidden = !isUpstream
        rightPadingLayout.constant = isUpstream ? 28 : 13.5
    }

}
