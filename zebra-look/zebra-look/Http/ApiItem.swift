//
//  ApiItem.swift
//
//
//  Created by alexiuce on 2021/7/20.
//

import Foundation


struct APIItem: YCAPIProtocol {
    var url: String { API.DOMAIN + URLPath}
    var extra: String?
    var description: String
    var method: YCHTTPMethod
    private let URLPath: String  // URL的path

    init(_ path: String, d: String, e: String? = nil, m: YCHTTPMethod = .get) {
        URLPath = path
        description = d
        extra = e
        method = m
    }

    init(_ path: String, m: YCHTTPMethod) {
        self.init(path, d: "", e: nil, m: m)
    }
    var httpHeader : [String: String] {
        get{
            var dict :[String: String] = [:]
            let infoDictionary = Bundle.main.infoDictionary!
            //主程序版本号
            if let majorVersion  = infoDictionary["CFBundleShortVersionString"] as? String {
                dict["version"] = majorVersion
            }
//            if UserAccountManager.share.isLogin {
//                dict["Authorization"] = UserAccountManager.share.user.auth_token
//            }
            return dict
        }
    }
    
}


/// App的接口
struct API {
    /// 项目的域名
    #if DEBUG
    static var DOMAIN = "http://47.98.58.132/api/api/v1/"
    #else
    static var DOMAIN = "http://47.98.58.132/api/api/v1/"
    #endif

    // MARK: - 登录模块
    struct Login {
        static let logout = APIItem("api/user/logout", d: "退出登录",m: .post)
        static let login = APIItem("api/user/account/login", d: "用户登录",m: .post)
        static let register = APIItem("api/user/register/email", d: "邮箱注册", m: .post)
        static let sendCode = APIItem("api/user/email/sendcode", d: "发送验证码",m: .post)
        static let resetEmailPwd = APIItem("api/user/email/forget/password", d: "重置密码",m: .post)
        
    }
    // MARK: - Home模块
    struct Home {
        static let fetchBanners = APIItem("home.banner", d: "banner列表", m: .get)
        static let fetchHotGoods = APIItem("home.hot.stock", d: "热门股票", m: .get)
        static let fetchHotBusiness = APIItem("home.hot.block", d: "热门行业", m: .get)
        static let fetchDataList = APIItem("home.data.message", d: "数据动态", m: .get)
       
    }
    // MARK: - 列表模块
    struct List {
        static let fetchOpinion = APIItem("choice.get.vewpoint.list", d: "获取观点", m: .get)
    }
    //MARK: - 工具模块
    struct Tools {
      
        
    }
    //MARK: - 我的模块
    struct Me {
        
       
    }
}


