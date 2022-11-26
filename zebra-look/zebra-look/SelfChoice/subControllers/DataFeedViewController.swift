//
//  DataFeedViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/26.
//

import UIKit
import JXPagingView

class DataFeedViewController: UIViewController {
    
    
    
    
    // Data
    var scrollCallback : ((UIScrollView)->())?
    // UI
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 116
        tableView.contentInset.top = 15
        let nib = UINib(nibName: DataFeedTableCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DataFeedTableCell.reUsedKey)
        
       
    }
}


extension DataFeedViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DataFeedTableCell.reUsedKey) as! DataFeedTableCell
        return cell
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollCallback?(scrollView)
    }
}



extension DataFeedViewController: JXPagingViewListViewDelegate {
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
