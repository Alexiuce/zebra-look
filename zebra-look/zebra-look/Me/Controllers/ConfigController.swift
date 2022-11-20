//
//  ConfigController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/15.
//

import UIKit
import FDFullscreenPopGesture

class ConfigController: UITableViewController {
    
    
    
    
    @IBOutlet weak var topContainerview: UIView!
    @IBOutlet weak var aboutContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "设置"
        fd_prefersNavigationBarHidden = false
        
        
        navigationController?.navigationBar.isHidden = false
        topContainerview.layer.cornerRadius = 10
        topContainerview.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        aboutContainerView.layer.cornerRadius = 10
        
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset.top = 1
    }

    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
}
