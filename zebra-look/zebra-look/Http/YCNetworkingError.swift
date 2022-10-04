//
//  YCNetworkingError.swift
//  YunChuanHttpLib
//
//  Created by alexiuce on 2021/5/11.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

/// 请求的错误反馈，继承`NSObject`为了让OC也能调用
public class YCNetworkingError: NSObject {
    /// 错误码
    @objc var code = -1
    /// 错误描述
    @objc var localizedDescription: String

    init(code: Int, desc: String) {
        self.code = code
        self.localizedDescription = desc
        super.init()
    }
}
