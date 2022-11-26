//
//  CoreDataTableCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/26.
//

import UIKit

class CoreDataTableCell: UITableViewCell {
    
    
    static let nibName = "CoreDataTableCell"
    static let reUsedKey = "CoreDataTableCell.key"
    

    // Data
    
    
    // UI
    @IBOutlet weak var containerView: UIView!
    
    
    
    
    // Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 7.5
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(named: "feBorderColor")?.cgColor
    }

  
    
}
