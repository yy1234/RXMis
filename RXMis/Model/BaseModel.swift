//
//  BaseModel.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/7.
//

import Foundation
import HandyJSON

class BaseModel: HandyJSON {
    
    /// Id
    var id:String!
    //JSON解析框架需要一个默认的init方法
    required init() {}
}
