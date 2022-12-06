//
//  AllPredictDataSource.swift
//  zebra-look
//
//  Created by alexiuce on 2022/12/4.
//

import UIKit

class DoingDataSource: NSObject {
    
    
    var dataArray:[NSObject] = []
    weak var weakTableView:UITableView!
    
    // public func
    static func dataSourceWithTableView(tv:UITableView) -> DoingDataSource{
        let nib = UINib(nibName: RelatedProductCell.nibName, bundle: nil)
        tv.register(nib, forCellReuseIdentifier: RelatedProductCell.reUsedKey)
        let ds = DoingDataSource()
        ds.weakTableView = tv
        return ds
    }

}



extension DoingDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RelatedProductCell.reUsedKey) as! RelatedProductCell
        return cell
    }
}
