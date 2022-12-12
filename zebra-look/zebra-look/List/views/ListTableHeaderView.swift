//
//  ListTableHeaderView.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/20.
//

import UIKit
import FSPagerView


protocol ListTableHeaderViewDelegate: NSObject {
    func listTableHeaderClickedMoreButton(isMore: Bool)
}


/** 观点 数据 */
struct OpinionData: CommonModelProtocol {
    /** id */
    let id : Int = 0
    /** stock id  */
    let block_id : Int = 0
    /** content  */
    let content : String = ""
    /** type :  1-我方观点； 2-对方观点  */
    let type : Int = 0
}


class ListTableHeaderView: UIView {
    
    // Data
    
    var ourOpinions:[OpinionData]? {
        didSet {
            updateUI()
        }
    }
    var otherOpinions:[OpinionData]? {
        didSet {
            updateUI()
        }
    }
    
    public weak var delegate: ListTableHeaderViewDelegate?
    
    // UI
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var moreContainerView: UIView!
    @IBOutlet weak var ourOpinionPageView: FSPagerView!
    @IBOutlet weak var otherOpinionPageViiew: FSPagerView!
    
    @IBOutlet weak var ourPageControl: ZBPageControl!
    
    @IBOutlet weak var othersPageControl: ZBPageControl!
    
    // Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        
        let gnib = UINib.init(nibName: OptionsCollectionViewCell.nibName, bundle: nil)
        ourOpinionPageView.register(gnib, forCellWithReuseIdentifier: OptionsCollectionViewCell.reUsedKey)
        otherOpinionPageViiew.register(gnib, forCellWithReuseIdentifier: OptionsCollectionViewCell.reUsedKey)
        
        
      
        ourPageControl.activeColor = UIColor(named: "listPageSelectedColor")!
        ourPageControl.inactiveColor = UIColor(named: "listPageNormalColor")!
        ourPageControl.activeSize = CGSize(width: 12.5, height: 4)
        ourPageControl.inactiveSize = CGSize(width: 8.5, height: 4)
        
       
        othersPageControl.activeColor = UIColor(named: "listPageSelectedColor")!
        othersPageControl.inactiveColor = UIColor(named: "listPageNormalColor")!
        othersPageControl.activeSize = CGSize(width: 12.5, height: 4)
        othersPageControl.inactiveSize = CGSize(width: 8.5, height: 4)
       
        
        
    }
    

    static func loadXibView() -> ListTableHeaderView {
        
        let view = Bundle.main.loadNibNamed("ListTableHeaderView", owner: nil)?.first as! ListTableHeaderView
        return view
    }
    
    
    fileprivate func updateUI(){
        ourPageControl.numberOfPages = ourOpinions?.count ?? 0
        othersPageControl.numberOfPages = otherOpinions?.count ?? 0
        ourOpinionPageView.reloadData()
        otherOpinionPageViiew.reloadData()
    }
    
    @IBAction func clickedMoreButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        delegate?.listTableHeaderClickedMoreButton(isMore: sender.isSelected)
        
        let delay = sender.isSelected ? 0.1 : 0
        UIView.animate(withDuration: 0.25, delay: delay) {
            
            self.moreContainerView.alpha = sender.isSelected ? 1 : 0
        }
       
        UIView.animate(withDuration: 0.35) {
            sender.transform = sender.isSelected ? CGAffineTransformMakeRotation(.pi) : CGAffineTransform.identity
            self.subTitleLabel.alpha = sender.isSelected ? 0 : 1
           
        }
        
    }
}


extension ListTableHeaderView: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        if pagerView == ourOpinionPageView {
            return ourOpinions?.count ?? 0
        }
        return otherOpinions?.count ?? 0
    }
    
    func pagerView(_ pagerView:FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: OptionsCollectionViewCell.reUsedKey, at: index) as! OptionsCollectionViewCell
        
        if pagerView == ourOpinionPageView {
            cell.cellData = ourOpinions?[index]
        }else{
            cell.cellData = otherOpinions?[index]
        }
        return cell
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        if pagerView == ourOpinionPageView {
            ourPageControl.currentPage = targetIndex
        }else{
            othersPageControl.currentPage = targetIndex
        }
    }
    
    
}
