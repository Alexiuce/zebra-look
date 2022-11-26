//
//  ReadHotDataViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/24.
//

import UIKit

class ReadHotDataViewController: UIViewController {

    
    
    
    // Data
    var rowCount = 6
    // UI
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // Layout
    
    @IBOutlet weak var topBackgroundHeightLayout: NSLayoutConstraint!
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

       title = "热点数据解读"
        
        
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableView.automaticDimension
        topBackgroundHeightLayout.constant = view.safeAreaInsets.top
        
        let hnib = UINib.init(nibName: HotDataTitleCell.nibName, bundle: nil)
        tableView.register(hnib, forCellReuseIdentifier: HotDataTitleCell.reUsedKey)
        
        let bnib = UINib.init(nibName: HotDataBottomCell.nibName, bundle: nil)
        tableView.register(bnib, forCellReuseIdentifier: HotDataBottomCell.reUsedKey)
        
        let tnib = UINib.init(nibName: HotDataTagCell.nibName, bundle: nil)
        tableView.register(tnib, forCellReuseIdentifier: HotDataTagCell.reUsedKey)
        
        let cnib = UINib.init(nibName: HotDataTextCell.nibName, bundle: nil)
        tableView.register(cnib, forCellReuseIdentifier: HotDataTextCell.reUsedKey)
        
        let mnib = UINib.init(nibName: HotDataMediaCell.nibName, bundle: nil)
        tableView.register(mnib, forCellReuseIdentifier: HotDataMediaCell.reUsedKey)
        
        
        
        
    }


}



extension ReadHotDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotDataTitleCell.reUsedKey) as! HotDataTitleCell
            return cell
            
        } else if indexPath.row == rowCount - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotDataBottomCell.reUsedKey) as! HotDataBottomCell
            return cell
        }else if indexPath.row == rowCount - 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotDataTagCell.reUsedKey) as! HotDataTagCell
            return cell
        }else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotDataMediaCell.reUsedKey) as! HotDataMediaCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: HotDataTextCell.reUsedKey) as! HotDataTextCell
        
        return cell
        
        
        
      
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 0 {
            topBackgroundHeightLayout.constant = view.safeAreaInsets.top
            return
        }
        topBackgroundHeightLayout.constant = view.safeAreaInsets.top + abs(offsetY)
        
    }
    
    
    
    
}
