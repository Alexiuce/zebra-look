//
//  HotGoodsCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/8.
//  热门商品

import UIKit


/** 热门商品 数据 */
struct HotGoodsData: CommonModelProtocol {

    /** id */
    let id : Int = 0
    /** stock id  */
    let stock_id : Int = 0
    /** goods intro  */
    let intro : String = ""
    /** goods name  */
    let name : String = ""
    /** goods code  */
    let code : String = ""
    /** goods price  */
    let price : String = ""
    /** goods type */
    let type : Int = 0
    /** link */
    let link : String = ""
    /** sort */
    let sort : Int = 0
    /** goods range */
    let range: String = ""
}


class HotGoodsCell: UITableViewCell {

    static let nibName = "HotGoodsCell"
    static let reUsedKey = "HotGoodsCell.key"
    
    // Data
    var cellDataList: [HotGoodsData]? {
        didSet {
            updateUI()
        }
    }
    
    
    // UI
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        
        let gnib = UINib.init(nibName: HotCollectionCell.nibName, bundle: nil)
        collectionView.register(gnib, forCellWithReuseIdentifier: HotCollectionCell.reUsedKey)
        flowLayout.itemSize = CGSize(width: 166, height: 75)
    }
    
    fileprivate func  updateUI(){
        collectionView.reloadData()
    }

}

// MARK:
extension HotGoodsCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellDataList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotCollectionCell.reUsedKey, for: indexPath) as! HotCollectionCell
        cell.cellData = cellDataList?[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        HomeCoordiantor.share.showCommodityPage()
    }
    
    
}
