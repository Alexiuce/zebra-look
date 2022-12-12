//
//  OptionsCollectionViewCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/21.
//

import UIKit
import FSPagerView

class OptionsCollectionViewCell: FSPagerViewCell {

    
    static let nibName = "OptionsCollectionViewCell"
    static let reUsedKey = "OptionsCollectionViewCell.key"
    
    
    // Data
    var cellData: OpinionData? {
        didSet {
            updateUI()
        }
    }
    
    // UI
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    fileprivate func updateUI(){
        
        contentLabel.text = cellData?.content
    }

}
