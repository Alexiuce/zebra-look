//
//  AppCoordinator.swift
//  Street36
//
//  Created by alexiuce on 2021/6/16.
//


import UIKit


class AppCoordinator : NSObject {
    var appWindow: UIWindow?
    static let share = AppCoordinator()
    public var currentNavController: UINavigationController?
    /** 显示页面  */
    public func showFollowAndFansPage(){
        let vc = UIViewController()
       
        currentNavController?.pushViewController(vc, animated: true)
    }
}
    
    

// MARK: - App Public Const
class AppConst {
        
    static let backgroundColor = UIColor(named: "backgroundColor")!
    static let viewColor = UIColor(named: "viewBgColor")!
   
}
