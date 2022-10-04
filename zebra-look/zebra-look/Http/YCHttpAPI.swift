//
//  YCHttpAPI.swift
//  YunChuanHttpLib
//
//  Created by alexiuce on 2021/5/11.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Alamofire
import Foundation







/// Type representing HTTP methods.
public enum YCHTTPMethod {
    /// Common HTTP methods.
    case delete, get, patch, post, put
}

/// API interface protocol
public protocol YCAPIProtocol {
    /// API URL address
    var url: String { get }
    /// API description information
    var description: String { get }
    /// API additional information, eg: Author | Note...
    var extra: String? { get }
    /// Type representing HTTP methods.
    var method: YCHTTPMethod { get }
    /// http header 
    var httpHeader: [String : String] {get}
}

/// Extension method
 extension YCAPIProtocol {

    /// 根据`YCAPIProtocol`进行一个网络请求
    ///
    /// - Parameters:
    ///   - parameters: `nil` by default.
    ///   - headers: `HTTPHeaders` value to be added to the `URLRequest`. `nil` by default.
    ///   - success: Successful response
    ///   - failed: Failed response
    ///
    func fetch(_ parameters: [String: Any]? = nil, headers: [String: String]? = nil, success: YCSuccessClosure?, failed: YCFailedClosure?) {
        let task = YC.fetch(self, parameters: parameters, headers: headers)
        if let s = success {
            task.success(s)
        }
        if let f = failed {
            task.failed(f)
        }
    }

    /// 根据`YCAPIProtocol`进行一个网络请求
    ///
    /// - Parameters:
    ///   - parameters: `nil` by default.
    ///   - headers: `HTTPHeaders` value to be added to the `URLRequest`. `nil` by default.
    ///
    func fetch(_ parameters: [String: Any]? = nil, headers: [String: String]? = nil) -> YCNetworkRequest {
        YC.fetch(self, parameters: parameters, headers: headers)
    }
}

/// 为了`YCAPIProtocol`给`YCNetworking`扩展的网络请求方法
public extension YCNetworking {
    /// Creates a request, for `YCAPIProtocol`
    ///
    /// - note: more see: `self.request(...)`
    @discardableResult
    func fetch(_ api: YCAPIProtocol, parameters: [String: Any]? = nil, headers: [String: String]? = nil) -> YCNetworkRequest {
        let method = methodWith(api.method)
        
        /** 设置公共参数  */
        let param = generateParam(oriParam: parameters)
        
        let task = request(url: api.url, method: method, parameters: param, headers: api.httpHeader)
        task.description = api.description
        task.extra = api.extra
        return task
    }
    /// Function to convert request method
    fileprivate func methodWith(_ m: YCHTTPMethod) -> Alamofire.HTTPMethod {
        // case delete, get, patch, post, put
        switch m {
        case .delete: return .delete
        case .get: return .get
        case .patch: return .patch
        case .post: return .post
        case .put: return .put
        }
    }
    
    
    
    fileprivate func generateParam(oriParam: [String: Any]?) -> [String: Any] {
        var p = oriParam ?? [:]
        p["app_id"] = 3
        
        p["timestamp"] = Int(Date().timeIntervalSince1970)
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            p["app_version"] = version
        }
        
    
        var temp = p
        /** 所有value 替换为字符串类型  */
        p.forEach { (key: String, value: Any) in
            if let _ = value as? String {}else{
                temp[key] = "\(value)"
            }
        }
        var signText = ""
        /** 按key排序 转换json text  */
        if let jsonData = try? JSONSerialization.data(withJSONObject: temp, options: .sortedKeys),
           let jsonText = String(data: jsonData, encoding: .utf8) {
            signText = "\(jsonText)1283181".replacingOccurrences(of: "\\/", with: "/")
        }
//        p["sign"] = signText.md5()
        return p
    }
}
