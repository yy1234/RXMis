//
//  StringExtend.swift
//  扩展字符串
//
//  Created by smile on 2019/6/7.
//  Copyright © 2019 ixuea. All rights reserved.
//

import Foundation

extension String {
    
    /// 是否符合手机号格式
    ///
    /// - Returns: <#return value description#>
    func isPhone() -> Bool {
        //使用谓词
//        let predicate=NSPredicate(format: "SELF MATCHES %@", REGX_PHONE)
//
//        return predicate.evaluate(with: self)
        return false
    }
    
    /// 去除字符串首尾的空格和换行
    ///
    /// - Returns: <#return value description#>
    func trim() -> String? {
        let whitespace=NSCharacterSet.whitespacesAndNewlines
        
        return trimmingCharacters(in: whitespace)
    }
    
    /// 是否符合昵称规范（2~15位）
    ///
    /// - Returns: <#return value description#>
    func isNickname() -> Bool {
        if self.count >= 2 && count <= 15 {
            return true
        }
        
        return false
    }
    
    /// 是否符合邮箱格式
    ///
    /// - Returns: <#return value description#>
    func isEmail() -> Bool {
//        let predicate=NSPredicate(format: "SELF MATCHES %@", REGX_EMAIL)
//
//        return predicate.evaluate(with: self)
        return false
    }
    
    /// 是否符合密码格式
    ///
    /// - Returns: <#return value description#>
    func isPassword() -> Bool {
        if count >= 6 && count <= 15 {
            return true
        }
        
        return false
    }
    
    /// 是否符合验证码格式
    ///
    /// - Returns: <#return value description#>
    func isCode() -> Bool {
        if self.count == 4 {
            return true
        }
        
        return false
    }
    
    /// 文本长度
    var length: Int {
        return count
    }
    
    /// 从指定位置截取文本到末尾
    ///
    /// - Parameter i: 从什么位置开始截取
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    /// 截取到指定位置
    ///
    /// - Parameter toIndex: 要截取到的位置
    /// - Returns: <#return value description#>
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    /// 支持通过数组的方式几区文本
    ///
    /// - Parameter r: <#r description#>
    subscript (r: Range<Int>) -> String {
        //创建一个范围
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)), upper: min(length, max(0, r.upperBound))))
        
        //开始位置
        let start = index(startIndex, offsetBy: range.lowerBound)
        
        //结束位置
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        
        //截取字符串并创建一个字符串返回
        return String(self[start ..< end])
    }
    
    /// 将一行字符串
    /// 拆分为单个字
    ///
    /// - Parameter line: <#line description#>
    /// - Returns: <#return value description#>
    func words() -> [String] {
        var results:[String]=[]
        for char in self {
            //循环每个字
            results.append(String(char))
        }
        
        return results
    }
    
    /// 是否包含文本
    ///
    /// - Parameter find: <#find description#>
    /// - Returns: <#return value description#>
    func contains(find:String) -> Bool {
        return range(of: find) != nil
    }
    
    /// 是否包含文本（忽略大小写）
    ///
    /// - Parameter find: <#find description#>
    /// - Returns: <#return value description#>
    func containsIgnoringCase(find:String) -> Bool {
        return range(of: find, options: .caseInsensitive) != nil
    }
}
