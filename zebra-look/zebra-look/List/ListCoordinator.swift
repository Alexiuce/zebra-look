//
//  ListCoordinator.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/21.
//

import UIKit
import Foundation


class ListCoordiantor {
    public static let share = ListCoordiantor()
    public var navController: UINavigationController?
}

// MARK: - Public Api
extension ListCoordiantor {
    
    /** 返回  */
    public func goback(){
        navController?.popViewController(animated: true)
    }
    
    /** 显示列表编辑页面  */
    public func showListEdit(){
        let vc = ListEditViewController()
        navController?.pushViewController(vc, animated: true)
    }
    /** 显示添加页面 */
    public func showListAdd(){
        let vc = ListAddViewController()
        navController?.pushViewController(vc, animated: true)
    }
    
}
