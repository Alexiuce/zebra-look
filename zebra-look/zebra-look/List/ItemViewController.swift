//
//  ItemViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/6.
//

import UIKit
import JXPagingView

class ItemViewController: UIViewController {

    // Data
    
    fileprivate var count = 10
    
    var scrollCallback : ((UIScrollView)->())?
    
    // UI
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cnib = UINib.init(nibName: ItemViewCell.nibName, bundle: nil)
        tableView.register(cnib, forCellReuseIdentifier: ItemViewCell.reUsedKey)
        
        
        let dnib = UINib.init(nibName: ItemFooterCell.nibName, bundle: nil)
        tableView.register(dnib, forCellReuseIdentifier: ItemFooterCell.reUsedKey)
        
        if #available(iOS 15.0, *){
            tableView.sectionHeaderTopPadding = 0
        }
    }
}

extension ItemViewController : UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < count - 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemViewCell.reUsedKey)!
            return cell
        }
        let footCell = tableView.dequeueReusableCell(withIdentifier: ItemFooterCell.reUsedKey)!
        return footCell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == count - 1 ? 120 : 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ListTableSectionHeaderView.loadXibView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == count - 1 {  // 添加
            ListCoordiantor.share.showListAdd()
        }
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollCallback?(scrollView)
    }
    
}
extension ItemViewController: JXPagingViewListViewDelegate {
    func listView() -> UIView {
        view
    }
    
    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        scrollCallback = callback
    }
    
 
    func listScrollView() -> UIScrollView {
        tableView
    }
}



