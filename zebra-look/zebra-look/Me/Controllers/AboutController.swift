//
//  AboutController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/16.
//

import UIKit

class AboutController: UITableViewController {

    
    
    // UI
    
    @IBOutlet weak var topContainerView: UIView!
    
    @IBOutlet weak var privacyContainerView: UIView!
    
    @IBOutlet weak var protocolContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "关于APP"
        
        let cr: CGFloat = 10
        
        tableView.contentInsetAdjustmentBehavior = .never
        topContainerView.layer.cornerRadius = cr
        topContainerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        
        privacyContainerView.layer.cornerRadius = cr
        privacyContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        protocolContainerView.layer.cornerRadius = cr
        protocolContainerView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
        
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    
        
       
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
  
    

}
