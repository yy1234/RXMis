//
//  Observable.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/5.
// 对Observable进行扩展
//添加解析的对象的方法

import Foundation
import RxSwift
//import Moya
import HandyJSON
public enum IxueaError: Swift.Error {
    case obectMapping
}
extension  Observable {
//    将字符串解析为对象
    public func mapObject<T: HandyJSON>(_ type: T.Type) -> Observable<T?> {
        return self.map { data in
            guard let dataString = data as? String else{return nil}
            if dataString.isEmpty {return nil}
            guard let result = type.deserialize(from: dataString) else {
                throw IxueaError.obectMapping
            }
            
            return result
        }
    }
}
