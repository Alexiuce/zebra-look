//
//  HomeCoordinator.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/4.
//


import UIKit
import Foundation

class HomeCoordiantor {
    public static let share = HomeCoordiantor()
    public var navController: UINavigationController?
}

// MARK: - Public Api
extension HomeCoordiantor {
    
    /** 返回  */
    public func goback(){
        navController?.popViewController(animated: true)
    }
    
    /** 显示商品页面  */
    public func showCommodityPage(){
        let vc = CategoryViewController()
        navController?.pushViewController(vc, animated: true)
    }
    
}
