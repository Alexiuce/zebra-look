//
//  MeViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/12.
//

import UIKit
import FDFullscreenPopGesture

class MeViewController: UIViewController {

    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.isTranslucent = false
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        let cnib = UINib.init(nibName: MeHeaderCell.nibName, bundle: nil)
        tableView.register(cnib, forCellReuseIdentifier: MeHeaderCell.reUsedKey)
        
        
        let dnib = UINib.init(nibName: MeNormalCell.nibName, bundle: nil)
        tableView.register(dnib, forCellReuseIdentifier: MeNormalCell.reUsedKey)
        
        
        let enib = UINib.init(nibName: MeInfoCell.nibName, bundle: nil)
        tableView.register(enib, forCellReuseIdentifier: MeInfoCell.reUsedKey)
        
        
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableView.automaticDimension
        
        MeCoordiantor.share.navContorller = navigationController
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fd_prefersNavigationBarHidden = true
    }

   
    // Action
    
   
    @IBAction func showConfig(_ sender: Any) {
        
        MeCoordiantor.share.showConfigPage()
        
    }
    

}

extension MeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MeHeaderCell.reUsedKey) as! MeHeaderCell
            cell.cellDelegate = self
            return cell
        }else if indexPath.row == 1 || indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MeNormalCell.reUsedKey) as! MeNormalCell
            cell.title = indexPath.row == 1 ? "我的订单":"联系我们"
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: MeInfoCell.reUsedKey)!
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1: MeCoordiantor.share.showMyOrderPage()
        case 2: MeCoordiantor.share.showOurInfoPage()
        case 3: MeCoordiantor.share.showConfigPage()
            
        default:
            break
        }
    }
    
}

extension MeViewController : MeHeaderCellDelegate {
    func headerCellDidClicked(cell: MeHeaderCell) {
        MeCoordiantor.share.showMeModifyPage()
    }
    func memberDidClicked(cell: MeHeaderCell) {
        MeCoordiantor.share.showBecomeMemberPage()
    }
}
