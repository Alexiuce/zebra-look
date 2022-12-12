//
//  HomeController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/8.
//

import UIKit
import MJRefresh

class HomeController: BaseViewController {


    // Data
    var banners:[BannerCellData]?
    var hotGoods:[HotGoodsData]?
    var businessList:[HotBusinessData]?
    var dataList:[HomeFeedData]?
    var currentPageIndex = 1
    
    
    // UI
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
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refreshList))
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMore))
        
        
        HomeCoordiantor.share.navController = navigationController
        
        loadData()
        loadHotGoods()
        loadBannerData()
        loadHotBusiness()
      
    }
    
    
    fileprivate func loadBannerData(){
        YC.fetch(API.Home.fetchBanners,parameters: ["position":1]).success { [weak self] resp in
            guard let data = resp.data as? JsonArray else { return }
            self?.banners = BannerCellData.modelsWithDicts(data)
            self?.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.none)
        }
    }
    
    fileprivate func loadHotGoods(){
        YC.fetch(API.Home.fetchHotGoods,parameters: ["type":1]).success { [weak self] resp in
            guard let data = resp.data as? JsonArray else { return }
            self?.hotGoods = HotGoodsData.modelsWithDicts(data)
            self?.tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: UITableView.RowAnimation.none)
        }
    }
    fileprivate func loadHotBusiness(){
        YC.fetch(API.Home.fetchHotBusiness,parameters: ["type":1]).success { [weak self] resp in
            guard let data = resp.data as? JsonArray else { return }
            self?.businessList = HotBusinessData.modelsWithDicts(data)
            self?.tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: UITableView.RowAnimation.none)
        }
    }
    fileprivate func loadData(){
        YC.fetch(API.Home.fetchDataList,parameters: ["page":currentPageIndex]).success { [weak self] resp in
            guard let data = resp.data as? JsonDict else { return }
            let pageData = data.kj.model(ZBPageData<[HomeFeedData]>.self)
            self?.tableView.mj_header?.endRefreshing()
            if self?.currentPageIndex == 1 {
                self?.dataList = pageData.items
                self?.tableView.mj_footer?.resetNoMoreData()
            }else {
                self?.dataList?.append(contentsOf: pageData.items ?? [])
            }
            if self?.currentPageIndex == pageData.pageInfo?.totalPage {
                self?.tableView.mj_footer?.endRefreshingWithNoMoreData()
            }else {
                self?.tableView.mj_footer?.endRefreshing()                
            }
            
            self?.tableView.reloadData()
        }.failed { error in
            self.tableView.mj_header?.endRefreshing()
            self.tableView.mj_footer?.endRefreshing()
            if self.currentPageIndex > 1 {
                self.currentPageIndex -= 1
            }
            print("load data error",error)
        }
    }
    
    @objc fileprivate func refreshList(){
        currentPageIndex = 1
        loadData()
    }
    @objc fileprivate func loadMore(){
        currentPageIndex += 1
        loadData()
    }
    
}

// MARK: - dataSource & delegate
extension HomeController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3 + (dataList?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeBannerCell.reUsedKey) as! HomeBannerCell
            cell.bannerList = banners
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotGoodsCell.reUsedKey) as! HotGoodsCell
            cell.cellDataList = hotGoods
            return cell
        }else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotBusinessCell.reUsedKey) as! HotBusinessCell
            cell.dataList = businessList
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
        cell.cellData = dataList?[indexPath.row - 3]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
  
    
    
}
