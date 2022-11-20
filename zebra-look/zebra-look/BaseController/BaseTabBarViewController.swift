//
//  BaseTabBarViewController.swift
//  Street36
//
//  Created by alexiuce on 2021/6/15.
//

import UIKit


class BaseTabBarViewController: UITabBarController {



    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        view.backgroundColor = AppConst.backgroundColor
//        UITabBar.appearance().tintColor = AppConst.redColor
        
        tabBar.standardAppearance.shadowColor = UIColor.red
     
        
    }
    
   

 
}


