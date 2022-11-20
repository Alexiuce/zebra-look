//
//  MemberPurchaseController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/16.
//

import UIKit
import FDFullscreenPopGesture

class MemberPurchaseController: UITableViewController {
    
    
    
    
    
    // UI
    
    @IBOutlet weak var topCellView: UIView!
    @IBOutlet weak var bottomCellView: UIView!
    
    
   
    @IBOutlet var btns: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "购买会员"
        fd_prefersNavigationBarHidden = false
        tableView.contentInsetAdjustmentBehavior = .never
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.contentInset.top = 14
        
        let cr: CGFloat = 10
        topCellView.layer.cornerRadius = cr
        topCellView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        bottomCellView.layer.cornerRadius = cr
        bottomCellView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }

    
    // Action
    
    @IBAction func clickedAgreeButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
    }
    
    @IBAction func clickedPurchaseButton(_ sender: Any) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btns.forEach { btn in
            btn.isSelected = btn.tag == indexPath.row
        }
    }
    
}
