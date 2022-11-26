//
//  HomeController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/8.
//

import UIKit

class HomeController: BaseViewController {

    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        navigationItem.titleView = NavSearchView.loadXibView()

        let cnib = UINib.init(nibName: HomeBannerCell.nibName, bundle: nil)
        tableView.register(cnib, forCellReuseIdentifier: HomeBannerCell.reUsedKey)
        
        let gnib = UINib.init(nibName: HotGoodsCell.nibName, bundle: nil)
        tableView.register(gnib, forCellReuseIdentifier: HotGoodsCell.reUsedKey)
        
        let hnib = UINib.init(nibName: HotBusinessCell.nibName, bundle: nil)
        tableView.register(hnib, forCellReuseIdentifier: HotBusinessCell.reUsedKey)
        
        let dnib = UINib.init(nibName: HomeDataCell.nibName, bundle: nil)
        tableView.register(dnib, forCellReuseIdentifier: HomeDataCell.reUsedKey)
        
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableView.automaticDimension
        
        HomeCoordiantor.share.navController = navigationController
      
    }
    
}

// MARK: - dataSource & delegate
extension HomeController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeBannerCell.reUsedKey)!
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotGoodsCell.reUsedKey)!
            return cell
        }else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotBusinessCell.reUsedKey)!
            return cell
        }
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeDataCell.reUsedKey) as! HomeDataCell
        if indexPath.row == 3 {
            cell.cellType = .FullHeader
        }else if indexPath.row == 4 {
            cell.cellType = .HalfHeader
        }else{
            cell.cellType = .NoHeader
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let p: JsonDict = ["limit":3]
        YC.fetch(API.Home.fetchBanners,parameters: p).success { response in
            print(response)
        }.failed { error in
            print(error)
        }
    }
    
  
    
    
}
