//
//  HomeDataCell.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/30.
//

import UIKit


enum HomeDataCellType {
    case FullHeader
    case HalfHeader
    case NoHeader
}



/** 首页动态 数据 */
struct HomeFeedData: CommonModelProtocol {

    /** id */
    let id : Int = 0
    /** stock id */
    let stock_id = 0
    /** block id */
    let block_id = 0
    /** content  */
    let content : String = ""
    /** image url */
    let img : String = ""
    /** type 1 -  股票； 2 - 行业 */
    let tpye : Int = 0
    /** create time */
    let created_at : String = ""
    /** update time */
    let updated_at : String = ""
}



class HomeDataCell: UITableViewCell {
    
    static let nibName = "HomeDataCell"
    static let reUsedKey = "HomeDataCell.key"
    
    // Data
    public var cellType: HomeDataCellType = .FullHeader {
        didSet{
            p_updateUI()
        }
    }
    var cellData: HomeFeedData? {
        didSet {
            p_updateUI()
        }
    }
    
    
    // UI
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var headerTimeLabel: UILabel!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var headerContainerView: UIView!
    
    // Layout
    
    @IBOutlet weak var headerHeightLayout: NSLayoutConstraint!
    @IBOutlet weak var headerImgTopLayout: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        
    }
    
    fileprivate func p_updateUI(){
       
        switch cellType {
        case .FullHeader:
            headerImgView.isHidden = false
            headerTimeLabel.isHidden = false
            headerTitleLabel.isHidden = false
            headerImgTopLayout.constant = 16
            headerHeightLayout.constant =  89
            headerContainerView.layer.cornerRadius = 16
            
        case .HalfHeader:
            headerImgView.isHidden = false
            headerTitleLabel.isHidden = true
            headerTimeLabel.isHidden = false
            headerImgTopLayout.constant = -20
            headerHeightLayout.constant =  52
            headerContainerView.layer.cornerRadius = 0
           
        case .NoHeader:
            headerImgTopLayout.constant = 16
            headerHeightLayout.constant =  18
            headerImgView.isHidden = true
            headerTitleLabel.isHidden = true
            headerTimeLabel.isHidden = true
            headerContainerView.layer.cornerRadius = 0
        }
        guard let content = cellData?.content else { return }
        // 设置内容文字样式
        let attrText = NSMutableAttributedString(string: "20:58【分类】\(content)")
        
        attrText.addAttributes([.foregroundColor:UIColor(named: "3eRedColor")!], range: NSRange(location: 0, length: 5))
        
        infoLabel.attributedText = attrText
    
        
        
        
        
        
    }
    

   
    
}
