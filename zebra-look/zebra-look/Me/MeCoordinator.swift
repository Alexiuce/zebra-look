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
   
    
   
    /** 显示联系我们页面  */
    public func showOurInfoPage(){
       let vc = OurInfoController()
        navContorller?.pushViewController(vc, animated: true)
    }
    
    /** 显示设置页面  */
    public func showConfigPage(){
        let vc = UIStoryboard(name: "ConfigStoryboard", bundle: nil).instantiateViewController(withIdentifier: "me_config")
    
        navContorller?.pushViewController(vc, animated: true)
       
    }
    
    /** 显示资料修改页面  */
    public func showMeModifyPage(){
        let vc = UIStoryboard(name: "MeModify", bundle: nil).instantiateViewController(withIdentifier: "me_modify")
    
        navContorller?.pushViewController(vc, animated: true)
    }
    
    /** 显示我的订单页面 */
    public func showMyOrderPage(){
        let vc = UIStoryboard(name: "MyOrder", bundle: nil).instantiateViewController(withIdentifier: "my_order")
    
        navContorller?.pushViewController(vc, animated: true)
        
    }
    
    /** 显示购买会员页面 */
    public func showBecomeMemberPage(){
        let vc = UIStoryboard(name: "MePurchase", bundle: nil).instantiateViewController(withIdentifier: "me_purchase")
    
        navContorller?.pushViewController(vc, animated: true)
    }
    
    
    /** 显示隐私协议页面  */
    public func showPrivacyPage(){
       
    }
    /** 显示用户协议页面  */
    public func showUserProtocolPage(){
       
    }


}


