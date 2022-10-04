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
       
        
        view.backgroundColor = UIColor.white
        UITabBar.appearance().tintColor = AppConst.redColor
        
     
        
    }
    
   

    /** 显示http 相关错误信息  */
    @objc fileprivate func showHttpMsg(noti: Notification){
        
    }
    /** 显示用户信息： 登录/注册/登出  */
    @objc fileprivate func showUserMsg(){
       
        
    }
    
    /** 用户token 过期  */
    @objc fileprivate func showUserExpired(){
        
    }
    
    /** 用户登录后，加载用户信息  */
    fileprivate func loadUserInfo(){
        
    }
}
// MARK: - Http
extension BaseTabBarViewController {
    /** 退出账号  */
    fileprivate func logoutUser(){
        
    }
}

