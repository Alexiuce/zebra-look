//
//  MeCoordinator.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/4.
//

import UIKit
import Foundation

class MeCoordiantor {
    static let share = MeCoordiantor()
    var navContorller: UINavigationController?
}

/// MARK: - Public
extension MeCoordiantor {
    /** 返回  */
    public func goback(){
        navContorller?.popViewController(animated: true)
    }
   
    
   
    /** 显示设置页面  */
    public func showSettingsPage(){
       
    }
    
    /** 显示重置密码页面  */
    public func showResetPwdPage(){
        let vc = UIViewController()
        vc.modalPresentationStyle = .custom
        navContorller?.present(vc, animated: true, completion: nil)
    }
    
    
    /** 显示关于我们页面  */
    public func showAboutUsPage(){
        let vc = UIViewController()
        navContorller?.pushViewController(vc, animated: true)
    }
    /** 显示隐私协议页面  */
    public func showPrivacyPage(){
       
    }
    /** 显示用户协议页面  */
    public func showUserProtocolPage(){
       
    }


}


