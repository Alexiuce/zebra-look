//
//  BannerCollectionCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/30.
//

import UIKit
import Kingfisher

class BannerCollectionCell: UICollectionViewCell {
    
    static let nibName = "BannerCollectionCell"
    static let reUsedKey = "BannerCollectionCell.key"

    
    // Data
    var cellData: BannerCellData? {
        didSet {
            updataUI()
        }
    }
    
    // UI
    @IBOutlet weak var imgView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 10
        imgView.layer.masksToBounds = true
    }
    
    fileprivate func updataUI(){
        guard let link = cellData?.img else { return  }
        imgView.kf.setImage(with: URL(string: link))
    }

}
