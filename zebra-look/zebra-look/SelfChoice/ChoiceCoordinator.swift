//
//  ChoiceCoordinator.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/4.
//

import UIKit
import Foundation

class ChoiceCoordiantor {
    public static let share = ChoiceCoordiantor()
    public var navController: UINavigationController?
}

// MARK: - Public Api
extension ChoiceCoordiantor {
    
    /** 返回  */
    public func goback(){
        navController?.popViewController(animated: true)
    }
    
    /** 显示热点数据解读页面  */
    public func showHotDataPage(){
        let vc = ReadHotDataViewController()
        navController?.pushViewController(vc, animated: true)
    }
    
    /** 显示分类页面 */
    public func showCategoryPage(){
        let vc = CategoryViewController()
        navController?.pushViewController(vc, animated: true)
    }
    
    /** 显示商品页面 */
    public func showCommodityPage(){
        let vc = CommodityViewController()
        navController?.pushViewController(vc, animated: true)
    }
    
}
