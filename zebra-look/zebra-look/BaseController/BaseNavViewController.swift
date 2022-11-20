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
        view.backgroundColor = AppConst.backgroundColor

        let appearance = UINavigationBarAppearance()
        appearance.backgroundImage = UIImage.init()
        appearance.backgroundColor = .white
        appearance.shadowColor = .white

        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        
      
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            let img = UIImage(named: "left_arrow")
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(goback))
            navigationBar.isHidden = false
        }
        
        
        super.pushViewController(viewController, animated: animated)
    }
}

extension BaseNavViewController {
    @objc fileprivate func goback(){
        popViewController(animated: true)
    }
}
