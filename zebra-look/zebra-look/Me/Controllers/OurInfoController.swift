//
//  OurInfoController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/13.
//  联系我们

import UIKit
import FDFullscreenPopGesture

class OurInfoController: UIViewController {
    
    
    // UI
    
    @IBOutlet weak var containerView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "我的"
        fd_prefersNavigationBarHidden = false
        containerView.layer.cornerRadius = 10
        
        
    }

   

   

}
