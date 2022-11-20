//
//  ListViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/5.
//

import UIKit
import SnapKit
import JXPagingView
import JXSegmentedView

extension JXPagingListContainerView: JXSegmentedViewListContainer {}

class ListViewController: UIViewController {
    
    var segmentTitles = ["默认","商品","分类"]
    var headerViewHeight = 148
    lazy var pagingView: JXPagingView = preferredPagingview()
    lazy var segmentView: JXSegmentedView = preferredSegmentView()
    let dataSource: JXSegmentedTitleDataSource = JXSegmentedTitleDataSource()
    lazy var userHeaderView: UIView = preferredTableHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.addSubview(pagingView)
        pagingView.mainTableView.backgroundColor = AppConst.viewColor
        pagingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        dataSource.titles = segmentTitles
        dataSource.titleSelectedColor = UIColor(named: "titleTextColor")!
        dataSource.titleNormalColor = UIColor(named: "66GrayColor")!
        dataSource.titleSelectedFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        dataSource.titleNormalFont = UIFont.systemFont(ofSize: 14, weight: .light)
        dataSource.isItemSpacingAverageEnabled = false
        segmentView.dataSource = dataSource
        
        pagingView.mainTableView.gestureDelegate = self
        segmentView.listContainer = pagingView.listContainerView
        
    }
  
    
    fileprivate func preferredPagingview() -> JXPagingView {
      JXPagingView(delegate: self)
    }
   
    fileprivate func preferredSegmentView() -> JXSegmentedView {
        let segment = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        segment.backgroundColor = UIColor.white
        segment.layer.cornerRadius = 13
        segment.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = UIColor(named: "a8GrayColor")
        segment.addSubview(bottomLineView)
        bottomLineView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        let editButton = UIButton(type: .custom)
        editButton.setTitle("编辑", for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        editButton.setTitleColor(UIColor(named: "9cGrayColor"), for: .normal)
        editButton.addTarget(self, action:#selector(clickedEditButton) , for: .touchUpInside)
        segment.addSubview(editButton)
        
        editButton.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(54)
        }
        
        return segment
    }
    fileprivate func preferredTableHeaderView() -> UIView {
        let headerView =  ListTableHeaderView.loadXibView()
        headerView.delegate = self
        return headerView
    }
    
    @objc fileprivate func clickedEditButton(){
        print("clicked edit button ..")
    }
   
}


extension ListViewController: JXPagingViewDelegate{
    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) -> JXPagingViewListViewDelegate {
        let itemVc = ItemViewController()
        
        return itemVc
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

extension ListViewController : ListTableHeaderViewDelegate {
    
    func listTableHeaderClickedMoreButton(isMore: Bool) {
       
        headerViewHeight = isMore ? 350 : 148
        pagingView.resizeTableHeaderViewHeight(animatable: true)
    }
    
}


extension ListViewController: JXPagingMainTableViewGestureDelegate {
    func mainTableViewGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if otherGestureRecognizer == segmentView.collectionView.panGestureRecognizer {
            return false
        }
        return gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) && otherGestureRecognizer.isKind(of: UIPanGestureRecognizer.self)
    }
    
}





