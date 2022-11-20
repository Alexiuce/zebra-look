//
//  ItemViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/6.
//

import UIKit
import JXPagingView

class ItemViewController: UIViewController {

    //
    var scrollCallback : ((UIScrollView)->())?
    
    // UI
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cnib = UINib.init(nibName: ItemViewCell.nibName, bundle: nil)
        tableView.register(cnib, forCellReuseIdentifier: ItemViewCell.reUsedKey)
        
//        tableView.estimatedRowHeight = 90
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 50
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
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemViewCell.reUsedKey)!
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ListTableSectionHeaderView.loadXibView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
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



