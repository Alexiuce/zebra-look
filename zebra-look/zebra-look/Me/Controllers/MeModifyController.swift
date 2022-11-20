//
//  MeModifyController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/16.
//

import UIKit
import FDFullscreenPopGesture

class MeModifyController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "修改资料"
        
        fd_prefersNavigationBarHidden = false
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.contentInsetAdjustmentBehavior = .never
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
   

}
