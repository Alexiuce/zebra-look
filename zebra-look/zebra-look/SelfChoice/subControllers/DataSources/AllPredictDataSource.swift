//
//  AllPredictDataSource.swift
//  zebra-look
//
//  Created by alexiuce on 2022/12/4.
//

import UIKit

class AllPredictDataSource: NSObject {
    
    
    var dataArray:[NSObject] = []
    weak var weakTableView:UITableView!
    
    
    
    
    
    // public func
    static func dataSourceWithTableView(tv:UITableView) -> AllPredictDataSource{
        let nib = UINib(nibName: RelatedProductCell.nibName, bundle: nil)
        tv.register(nib, forCellReuseIdentifier: RelatedProductCell.reUsedKey)
        let ds = AllPredictDataSource()
        tv.dataSource = ds
        tv.rowHeight = 55
        ds.weakTableView = tv
        tv.contentInset.top = 5
        return ds
    }

}



extension AllPredictDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RelatedProductCell.reUsedKey) as! RelatedProductCell
        return cell
    }
}
