//
//  ApiItem.swift
//  Street36
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
    static var DOMAIN = "https://testapi.lemonveil.com/"
    #else
    static var DOMAIN = "https://api.lemonveil.com/"
    #endif

    // MARK: - 登录模块
    struct Login {
        static let logout = APIItem("api/user/logout", d: "退出登录",m: .post)
        static let login = APIItem("api/user/account/login", d: "用户登录",m: .post)
        static let register = APIItem("api/user/register/email", d: "邮箱注册", m: .post)
        static let sendCode = APIItem("api/user/email/sendcode", d: "发送验证码",m: .post)
        static let resetEmailPwd = APIItem("api/user/email/forget/password", d: "重置密码",m: .post)
        
    }
    // MARK: Home模块
    struct Home {
        static let followUser = APIItem("api/user/follow", d: "关注用户", m: .post)
        static let discovery = APIItem("api/stock/news", d: "首页发现列表", m: .get)
        static let unFollowUser = APIItem("api/user/unfollow", d: "取消关注用户", m: .post)
        static let favArticle = APIItem("api/stock/news/favorite", d: "收藏文章", m: .post)
        static let reportArticle = APIItem("api/stock/news/report", d: "举报文章", m: .post)
        static let homeFollow = APIItem("api/stock/follower/news", d: "首页关注列表", m: .get)
        static let contentDetail = APIItem("api/stock/news/detail", d: "文章内容详情", m: .get)
        static let commentList = APIItem("api/stock/content/comment", d: "文章评论列表", m: .get)
        static let unFavArticle = APIItem("api/stock/news/unfavorite", d: "取消收藏文章", m: .post)
        static let sendComment = APIItem("api/stock/content/comment/add", d: "添加文章评论", m: .post)
    }
    // MARK: - 资讯模块
    struct News {
        static let stockTimeList = APIItem("api/stock/tiger/list", d: "龙虎榜", m: .get)
    }
    //MARK: - 工具模块
    struct Tools {
        static let fetchRecords = APIItem("api/stock/invest/list", d: "获取投资记录", m: .get)
        static let addStockRecord = APIItem("api/stock/invest/create", d: "添加股票记录", m: .post)
        
    }
    
    
    // MARK: 我的模块
    struct Me {
        
        static let fansList = APIItem("api/user/fans", d: "粉丝列表",m: .get)
        static let userInfo = APIItem("api/user/detail", d: "用户信息",m: .get)
        static let followList = APIItem("api/user/follows", d: "关注列表",m: .get)
        static let tokenRefresh = APIItem("api/user/refresh", d: "token刷新",m: .post)
        static let updateUserInfo = APIItem("api/user/edit", d: "更新用户信息",m: .post)
        static let articleList = APIItem("api/stock/user/news", d: "用户文章列表",m: .get)
        static let deleteDraft = APIItem("api/stock/news/delete", d: "删除草稿",m: .post)
        static let commitContext = APIItem("api/stock/news/publish", d: "发布文章",m: .post)
        static let draftEditCommit = APIItem("api/stock/news/edit", d: "草稿编辑提交",m: .post)
        static let myArticleList = APIItem("api/stock/user/publish/list", d: "自己的文章列表",m: .get)
    }
}


