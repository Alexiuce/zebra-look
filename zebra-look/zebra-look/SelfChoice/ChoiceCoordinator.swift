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
    
    /** 显示页面  */
    
}
