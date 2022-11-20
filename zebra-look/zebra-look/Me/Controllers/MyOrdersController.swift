//
//  MyOrdersController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/16.
//

import UIKit
import FDFullscreenPopGesture

class MyOrdersController: UITableViewController {
    
    // UI
    
    
    @IBOutlet weak var topCellView: UIView!
    @IBOutlet weak var bottomCellView: UIView!
    
    @IBOutlet weak var lastCellView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "我的订单"
        let cr: CGFloat = 10
        tableView.contentInsetAdjustmentBehavior = .never
        
        
        topCellView.layer.cornerRadius = cr
        topCellView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        lastCellView.layer.cornerRadius = cr
        bottomCellView.layer.cornerRadius = cr
        bottomCellView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        

        fd_prefersNavigationBarHidden = false
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.contentInset.top = 14
        
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
  

}
