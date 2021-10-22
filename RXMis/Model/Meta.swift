//
//  Meta.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/6.
//

import Foundation
//导入JSON解析框架
import HandyJSON

class Meta<T>: HandyJSON {
    ///定义一个列表
    ///里面使用了泛型
    var data:Array<T>?
  required  init() {
        
    }
}
