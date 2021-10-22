//
//  DetailResponse.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/6.
//

import Foundation
//导入JSON解析框架
import HandyJSON

/// 继承BaseResponse
/// 定义了一个泛型T
/// 返回必须实现了HandyJSON协议
/// 因为我们希望用户传递的类要能解析为JSON
class DetailResponse<T: HandyJSON>: BaseResponse {
    
    /// 真实数据
    /// 他的类型就是返回
    var data:T?
    
}
