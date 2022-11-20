//
//  ListTableHeaderView.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/20.
//

import UIKit


protocol ListTableHeaderViewDelegate: NSObject {
    func listTableHeaderClickedMoreButton(isMore: Bool)
}


class ListTableHeaderView: UIView {
    
    // Data
    public weak var delegate: ListTableHeaderViewDelegate?
    // UI
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var moreButton: UIButton!
    // Life cycle
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 16
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        
    }
    
    

    static func loadXibView() -> ListTableHeaderView {
        
        let view = Bundle.main.loadNibNamed("ListTableHeaderView", owner: nil)?.first as! ListTableHeaderView
        return view
    }
    
    
    
    @IBAction func clickedMoreButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        UIView.animate(withDuration: 0.5) {
            sender.transform = sender.isSelected ? CGAffineTransformMakeRotation(.pi) : CGAffineTransform.identity
        }
        delegate?.listTableHeaderClickedMoreButton(isMore: sender.isSelected)
        
    }
    

}
