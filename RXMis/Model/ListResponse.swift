//
//  ListResponse.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/6.
//

import Foundation
import HandyJSON
//JSON解析为对象 import HandyJSON
class ListResponse<T: HandyJSON>: BaseResponse {
/// 定义一个列表
/// 里面的对象使用了泛型
 var data:Meta<T>?
}
