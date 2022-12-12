//
//  HotBusinessCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/8.
//  热门行业

import UIKit


/** 热门行业 数据 */
struct HotBusinessData: CommonModelProtocol {

    /** id */
    let id : Int = 0
    /** bock id  */
    let block_id : Int = 0
    /** Hot business intro  */
    let intro : String = ""
    /** hot business name  */
    let name : String = ""
    /** hot business code  */
    let code : String = ""
    /** hot business type */
    let type : Int = 0
    /** img url */
    let img : String = ""
    /** sort */
    let sort : Int = 0
}


class HotBusinessCell: UITableViewCell {

    static let nibName = "HotBusinessCell"
    static let reUsedKey = "HotBusinessCell.key"
    
    
    // Data
    var dataList: [HotBusinessData]? {
        didSet {
            p_updateUI()
        }
    }
    
    // UI
    @IBOutlet weak var containerView: ZBGradientView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        
        let gnib = UINib.init(nibName: BusinessCollectionViewCell.nibName, bundle: nil)
        collectionView.register(gnib, forCellWithReuseIdentifier: BusinessCollectionViewCell.reUsedKey)
        flowLayout.itemSize = CGSize(width: 108, height: 123)
        
        // 设置渐变色
        let cls = [UIColor.white.cgColor, UIColor(named: "viewBgColor")!.cgColor]
        containerView.gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        containerView.gradientLayer.endPoint =  CGPoint(x: 0.5, y: 1)
        containerView.gradientLayer.colors = cls
        
    }

    fileprivate func  p_updateUI(){
        collectionView.reloadData()
    }
    
    
}

// MARK:
extension HotBusinessCell : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataList?.count ?? 0
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BusinessCollectionViewCell.reUsedKey, for: indexPath) as! BusinessCollectionViewCell
        
        cell.cellData = dataList?[indexPath.item]
        return cell
    }
  
    
}
