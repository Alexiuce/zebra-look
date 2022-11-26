//
//  RelatedProductController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/26.
//

import UIKit
import JXPagingView

class RelatedProductController: UIViewController {

    
    // Data
    var scrollCallback : ((UIScrollView)->())?
    
    // UI
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 55
        tableView.contentInset.top = 5
        let nib = UINib(nibName: RelatedProductCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: RelatedProductCell.reUsedKey)
        
    }
}

extension RelatedProductController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RelatedProductCell.reUsedKey) as! RelatedProductCell
        return cell
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollCallback?(scrollView)
    }
}



extension RelatedProductController: JXPagingViewListViewDelegate {
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

