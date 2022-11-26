//
//  ListEditCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/21.
//

import UIKit


protocol ListEditCellDelegate: NSObjectProtocol {
    
    func editCellDidClickedTopUpEvent(cell:ListEditCell)
}




class ListEditCell: UITableViewCell {

    
    static let nibName = "ListEditCell"
    static let reUsedKey = "ListEditCell.key"
    
    // Data
    weak var cellDelegate: ListEditCellDelegate?
    
    // UI
    
    @IBOutlet weak var selectedImgView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let imgName = selected ? "dot_selected":"dot_normal"
        selectedImgView.image = UIImage(named: imgName)
    }
    
    
    
    
    @IBAction func clickedTopUpButton(_ sender: Any) {
        cellDelegate?.editCellDidClickedTopUpEvent(cell: self)
    }
    
    
    
}
