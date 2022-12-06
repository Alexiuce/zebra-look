//
//  CategoryViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/26.
//

import UIKit
import SnapKit
import JXPagingView
import JXSegmentedView

class CategoryViewController: UIViewController {
    
    let headerViewHeight = 338
    var segmentTitles = ["核心数据","预期管理","数据动态","相关商品"]
    
    lazy var pagingView: JXPagingView = preferredPagingview()
    lazy var rightItemView: UIView = preferredRightItemView()
    lazy var userHeaderView: UIView = preferredTableHeaderView()
    lazy var segmentView: JXSegmentedView = preferredSegmentView()
    let dataSource: JXSegmentedTitleDataSource = JXSegmentedTitleDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "分类"
    
        view.addSubview(pagingView)
        pagingView.mainTableView.backgroundColor = AppConst.viewColor
        pagingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        navigationController?.navigationBar.isTranslucent = false
        
        
        dataSource.titles = segmentTitles
        dataSource.titleNormalColor = UIColor.black
        dataSource.titleSelectedColor = UIColor.white
        dataSource.titleNormalFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        dataSource.titleSelectedFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        segmentView.dataSource = dataSource
        
        pagingView.mainTableView.gestureDelegate = self
        segmentView.listContainer = pagingView.listContainerView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightItemView)
        
        
    }

    fileprivate func preferredPagingview() -> JXPagingView {
      JXPagingView(delegate: self)
    }
   
    fileprivate func preferredSegmentView() -> JXSegmentedView {
        let segment = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        segment.backgroundColor = UIColor.white
        segment.layer.cornerRadius = 13
        segment.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        
        let indicatoryView = JXSegmentedIndicatorBackgroundView()
        indicatoryView.indicatorColor = .red
        indicatoryView.indicatorWidth = 80
        indicatoryView.indicatorHeight = 30
        indicatoryView.indicatorWidthIncrement = 0
        segment.indicators = [indicatoryView]
        
        
        return segment
    }
    fileprivate func preferredTableHeaderView() -> UIView {
        let headerView =  CategoryHeadView.loadXibView()
        return headerView
    }
    
    fileprivate func preferredRightItemView() -> UIView {
        let rightView = UIButton()
        rightView.layer.cornerRadius = 5
        rightView.layer.borderWidth = 0.5
        rightView.setTitle("+ 自选", for: .normal)
        rightView.frame = CGRect(x: 0, y: 0, width: 60, height: 25)
        rightView.layer.borderColor = UIColor(named: "3eRedColor")?.cgColor
        rightView.setTitleColor(UIColor(named: "3eRedColor"), for: .normal)
        rightView.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return rightView
    }
    
}

extension CategoryViewController: JXPagingViewDelegate{
    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) -> JXPagingViewListViewDelegate {
        
        switch index {
        case 0 : return CoreDataViewController()
        case 2 : return DataFeedViewController()
        case 3 : return RelatedProductController()
        default:
            let vc = PredictManagerController()
            return vc
        }
    }
    
    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
        headerViewHeight
    }
    
    func tableHeaderView(in pagingView: JXPagingView) -> UIView {
      userHeaderView
    }
    
    func heightForPinSectionHeader(in pagingView: JXPagingView) -> Int {
        50
    }
    
    func viewForPinSectionHeader(in pagingView: JXPagingView) -> UIView {
        segmentView
    }
    
    func numberOfLists(in pagingView: JXPagingView) -> Int {
        segmentTitles.count
    }
}

extension CategoryViewController: JXPagingMainTableViewGestureDelegate {
    func mainTableViewGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if otherGestureRecognizer == segmentView.collectionView.panGestureRecognizer {
            return false
        }
        return gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) && otherGestureRecognizer.isKind(of: UIPanGestureRecognizer.self)
    }
    
}
