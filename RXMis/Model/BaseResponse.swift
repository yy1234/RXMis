//
//  BaseResponse.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/6.
//

import Foundation
import HandyJSON

class BaseResponse: HandyJSON {
    
    /// 状态码
    /// 只有发生了错误才会有
    var status:Int?
    
    /// 错误信息
    /// 发生了错误不一定有
    var message:String?
    
    /// 因为实现了HandyJSON 12 /// 他要求有一个init方法
   required init() {}
}
