//
//  BaseNavViewController.swift
//  Street36
//
//  Created by alexiuce on 2021/7/17.
//

import UIKit

class BaseNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 去除底部横线
        navigationBar.shadowImage = UIImage()
      
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            let img = UIImage(named: "nav_back_icon")
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(goback))
        }
        
        
        super.pushViewController(viewController, animated: animated)
    }
}

extension BaseNavViewController {
    @objc fileprivate func goback(){
        popViewController(animated: true)
    }
}
