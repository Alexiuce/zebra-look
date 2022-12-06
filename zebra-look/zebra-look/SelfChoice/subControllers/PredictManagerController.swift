//
//  PredictManagerController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/27.
//

import UIKit
import JXPagingView

class PredictManagerController: UIViewController {

    
    
    // Data
    var scrollCallback : ((UIScrollView)->())?
    var dataSourceArray:[UITableViewDataSource] = []
    
    // UI
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var doingLabel: UILabel!
    @IBOutlet weak var expiredLabel: UILabel!
    @IBOutlet weak var dangerousLabel: UILabel!
    @IBOutlet weak var completeLabel: UILabel!
    
    
    //
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let totalPredictDataSource = AllPredictDataSource.dataSourceWithTableView(tv: tableView)
        dataSourceArray.append(totalPredictDataSource)
        
        let dds = DoingDataSource.dataSourceWithTableView(tv: tableView)
        dataSourceArray.append(dds)
        let dds1 = DoingDataSource.dataSourceWithTableView(tv: tableView)
        dataSourceArray.append(dds1)
        let dds2 = DoingDataSource.dataSourceWithTableView(tv: tableView)
        dataSourceArray.append(dds2)
        let dds3 = DoingDataSource.dataSourceWithTableView(tv: tableView)
        dataSourceArray.append(dds3)
        
        

        totalLabel.layer.cornerRadius = 10
        completeLabel.layer.cornerRadius = 10
        totalLabel.layer.borderWidth = 0.5
        completeLabel.layer.borderWidth = 0.5
        totalLabel.layer.borderColor = UIColor(named: "9cGrayColor")?.cgColor
        completeLabel.layer.borderColor = totalLabel.layer.borderColor
        totalLabel.layer.masksToBounds = true
        completeLabel.layer.masksToBounds = true
        
        doingLabel.layer.cornerRadius = 10
        doingLabel.layer.borderWidth = 0.5
        doingLabel.layer.borderColor = UIColor(named: "3eRedColor")?.cgColor
        doingLabel.layer.masksToBounds = true
        
        expiredLabel.layer.cornerRadius = 10
        expiredLabel.layer.borderWidth = 0.5
        expiredLabel.layer.borderColor = UIColor(named: "textGreenColor")?.cgColor
        expiredLabel.layer.masksToBounds = true
        
        dangerousLabel.layer.cornerRadius = 10
        dangerousLabel.layer.borderWidth = 0.5
        dangerousLabel.layer.borderColor = UIColor(named: "startOrangeColor")?.cgColor
        dangerousLabel.layer.masksToBounds = true
        
        
    }


    @IBAction func clickedTotalLabel(_ sender: Any) {
        tableView.dataSource = dataSourceArray[0]
       
        tableView.reloadData()
        
    }
    
    @IBAction func clickedDoingLabel(_ sender: Any) {
        tableView.dataSource = dataSourceArray[1]
       
        tableView.reloadData()
    }
    
    
    @IBAction func clickedExpiredLabel(_ sender: Any) {
        tableView.dataSource = dataSourceArray[2]
       
        tableView.reloadData()
    }
    
    @IBAction func clickedDangerousLabel(_ sender: Any) {
        tableView.dataSource = dataSourceArray[3]
       
        tableView.reloadData()
    }
    
    @IBAction func clickedCompletedLabel(_ sender: Any) {
        tableView.dataSource = dataSourceArray[4]
       
        tableView.reloadData()
    }
    
}
extension PredictManagerController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollCallback?(scrollView)
    }
}
extension PredictManagerController: JXPagingViewListViewDelegate {
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
