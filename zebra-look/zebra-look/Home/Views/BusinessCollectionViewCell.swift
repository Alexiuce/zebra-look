//
//  BusinessCollectionViewCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/10.
//

import UIKit

class BusinessCollectionViewCell: UICollectionViewCell {
    
    
    static let nibName = "BusinessCollectionViewCell"
    static let reUsedKey = "BusinessCollectionViewCell.key"
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 8
    
        containerView.layer.shadowColor = UIColor(red: 0.18, green: 0.54, blue: 0.98, alpha: 0.75).cgColor
        containerView.layer.shadowOffset = .init(width: 0, height: 2)
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowOpacity = 0.2
        containerView.km_ApplyShadow()
       
    }

}
