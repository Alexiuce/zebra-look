//
//  DataModel.swift
//  zebra-look
//
//  Created by alexiuce on 2022/7/24.
//

import UIKit
import KakaJSON
import Foundation


typealias JsonArray = [JsonDict]
typealias JsonDict = [String : Any]


enum ZBUserType: String {
    case systemUser = "100"
    case normalUser = "101"
    case monthMember = "201"
    case seasonMemeber = "202"
    case halfYearMember = "203"
    case yearMember = "204"
}




protocol CommonModelProtocol : Convertible {
//    associatedtype ModeType
    /** json 字典转模型 */
    static func modelWithDict(_ json: JsonDict) ->  Self
    /** json 字符串转模型 */
    static func modelWithJsonString(_ str: String) -> Self
    /** json 数组转模型数组 */
    static func modelsWithDicts(_ jsons: JsonArray) -> [Self]
    /** json 字符串转模型数组 */
    static func modelsWithJsonString(_ str: String) -> [Self]
    
    
}

extension CommonModelProtocol {
    
    /** json 字典转模型 */
    static func modelWithDict(_ json: JsonDict) ->  Self {
        return json.kj.model(type:Self.self) as! Self
    }
    /** json 数组转模型数组 */
    static func modelsWithDicts(_ jsons: JsonArray) -> [Self] {
        return jsons.kj.modelArray(type:Self.self) as! [Self]
    }
    /** json 字符串转模型 */
    static func modelWithJsonString(_ str: String) -> Self{
        return str.kj.model(type:Self.self) as! Self
    }
    /** json 字符串转模型数组 */
    static func modelsWithJsonString(_ str: String) -> [Self] {
        return str.kj.modelArray(type:Self.self) as! [Self]
    }
}



// MARK: - Http Response Data

struct StHttpResponseData: Convertible {
    let data: Any? = nil
    let message: String = ""
    private (set) var code : Int = 0
}


// MARK: - User Info Data
class UserAccountManager {
    public static let share = UserAccountManager()
    
    // 用户数据
    public var user : STUserAccount = STUserAccount()
    
    /** 用户是否登录  */
    public var isLogin: Bool {
        get {
            return user.phone.count > 0
        }
    }
    
    fileprivate lazy var userAccountPath: String = {
        guard let s = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last else {
            return ""
        }
        return s + "/uq_acc.uud"
    }()
    
    private init(){
        
        guard let account = read(STUserAccount.self, from: userAccountPath) else { return  }
        user = account
        
    }
    /** 更新用户账号信息 */
    public func updateUserAccount(account: STUserAccount){
        user = account
        write(account, to: userAccountPath)
    }
    /** 清空用户账号 */
    public func clearUserAccount(){
        user = STUserAccount()
        write(user, to: userAccountPath)
    }
    /** 补充用户信息 */
    public func supplementUserInfo(json: [String:Any]) {
        var u = user
        u.kj_m.convert(from: json)
        user = u
        write(user, to: userAccountPath)
    }
    
    /** 上传头像图片  */
    public func uploadAvatarImg(picture: UIImage){
        
    }
    /** 上传图片  */
    public func uploadImg(picture: UIImage, callback: ((_ imgUrl: String)->Void)? = nil){
       
    }
}

/** 用户数据 */
struct STUserAccount: CommonModelProtocol {
   
    /** 用户id */
    let id : Int = 0
    /** 手机号 */
    let phone : String = ""
    /** 用户名 */
    let username: String = ""
    /** 用户类型 */
    var user_type : ZBUserType = .normalUser
    
    /** 昵称  */
    var nickname: String = ""
    /** 头像  */
    var avatar: String = ""
    
}

// MARK: - ** 分页列表数据  *

struct ZBPageData <Element>: CommonModelProtocol {
    var items:Element? = nil
    var pageInfo: ZBPageInfoData? = nil
}
struct ZBPageInfoData: Convertible {
    var currentPage : Int = 0
    var total: Int = 0
    var totalPage: Int = 0
}



