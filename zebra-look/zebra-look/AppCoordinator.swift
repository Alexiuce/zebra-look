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
        let vc = ViewController()
       
        currentNavController?.pushViewController(vc, animated: true)
    }
}
    
    

// MARK: - App Public Const
class AppConst {
    static let redColor =  UIColor(named: "redColor")!
    static let lineColor = UIColor(named: "lineColor")!
    static let whiteColor = UIColor(named: "whiteColor")!
    static let greenColor =  UIColor(named: "appGreenColor")!       
    static let backgroundColor = UIColor(named: "f6GrayColor")!
    static let grayTextColor =   UIColor(named: "textGrayColor")!
    static let normalTextColor = UIColor(named: "titleTextColor")!
}
