//
//  BusinessCollectionViewCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/10.
//

import UIKit
import Kingfisher

class BusinessCollectionViewCell: UICollectionViewCell {
    
    
    static let nibName = "BusinessCollectionViewCell"
    static let reUsedKey = "BusinessCollectionViewCell.key"
    
    // Data
    
    var cellData: HotBusinessData? {
        didSet {
            updateUI()
        }
    }
    
    
    // UI
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var opButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backgroundImgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 8
    
        containerView.layer.shadowColor = UIColor(red: 0.18, green: 0.54, blue: 0.98, alpha: 0.75).cgColor
        containerView.layer.shadowOffset = .init(width: 0, height: 2)
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowOpacity = 0.2
        containerView.km_ApplyShadow()
       
        opButton.layer.cornerRadius = 12.5
        opButton.layer.masksToBounds = true
        
    }
    fileprivate func updateUI(){
        nameLabel.text = cellData?.name
        infoLabel.text = cellData?.intro
        guard let imgUrl = cellData?.img else { return }
        backgroundImgView.kf.setImage(with: URL(string: imgUrl))
        
    }

}
