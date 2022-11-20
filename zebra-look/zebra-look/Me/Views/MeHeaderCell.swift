//
//  MeHeaderCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/12.
//

import UIKit




protocol MeHeaderCellDelegate: NSObject {
    func headerCellDidClicked(cell: MeHeaderCell)
    func memberDidClicked(cell : MeHeaderCell)
}


class MeHeaderCell: UITableViewCell {
    
    static let nibName = "MeHeaderCell"
    static let reUsedKey = "MeHeaderCell.key"
    
    // Data
    
    public weak var cellDelegate: MeHeaderCellDelegate?
    
    
    // UI
    @IBOutlet weak var gradientView: ZBGradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        gradientView.layer.cornerRadius = 23.5
        gradientView.layer.masksToBounds = true
        
        // 设置渐变色
        let cls = [UIColor(named: "startOrangeColor")!.cgColor, UIColor(named: "endOrangeColor")!.cgColor]
        gradientView.gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientView.gradientLayer.endPoint =  CGPoint(x: 1, y: 0.5)
        gradientView.gradientLayer.colors = cls
    }

    // Action
    
    @IBAction func clickedAvatar(_ sender: Any) {
    
        cellDelegate?.headerCellDidClicked(cell: self)
        
        
    }
    
    
    @IBAction func clickedMember(_ sender: Any) {
        
        cellDelegate?.memberDidClicked(cell: self)
        
    }
    
}
