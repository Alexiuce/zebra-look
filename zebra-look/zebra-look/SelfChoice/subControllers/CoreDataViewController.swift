//
//  CoreDataViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/26.
//

import UIKit
import JXPagingView

class CoreDataViewController: UIViewController {

    
    
    // Data
    var scrollCallback : ((UIScrollView)->())?
    
    // UI
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 396
        tableView.contentInset.top = 15
        let nib = UINib(nibName: CoreDataTableCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CoreDataTableCell.reUsedKey)
        
    }

}


extension CoreDataViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoreDataTableCell.reUsedKey) as! CoreDataTableCell
        return cell
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollCallback?(scrollView)
    }
}



extension CoreDataViewController: JXPagingViewListViewDelegate {
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
