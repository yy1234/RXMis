//
//  ResourceUtil.swift
//  RXMis
//  资源工具类
//  Created by 杨洋 on 2021/9/17.
//

import Foundation
class ResourceUtil {
    
    /// 将相对路径的资源转为绝对路径
    ///
    /// - Parameter uri: <#uri description#>
    /// - Returns: <#return value description#>
    static func resourceUri(_ uri:String) -> String {
        return "\(RESOURCE_ENDPOINT)/\(uri)"
    }
    
}
