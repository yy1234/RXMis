//
//  FileUtil.swift
//  文件相关工具类
//
//  Created by smile on 2019/6/7.
//  Copyright © 2019 ixuea. All rights reserved.
//

import Foundation

class FileUtil {
    
    /// 文件大小格式化
    ///
    /// - Parameter data: 文件大小；单位byte
    /// - Returns: 格式化的文件大小；例如：1.22M
    static func formatFileSize(_ data:Int) -> String {
        if data > 0{
            let size=Double(data)
            
            let kiloByte=size/1024
            if kiloByte < 1 && kiloByte > 0 {
                //不足1K
                return String(format: "%.2fByte", size)
            }
            
            let megaByte = kiloByte / 1024
            if megaByte < 1 {
                //不足1M
                return String(format: "%.2fK", kiloByte)
            }
            
            let gigaByte = megaByte / 1024
            if gigaByte < 1 {
                //不足1G
                return String(format: "%.2fM", megaByte)
            }
            
            let teraByte = gigaByte / 1024
            if teraByte < 1 {
                //不足1T
                return String(format: "%.2fG", gigaByte)
            }
            
            return String(format: "%.2fT", teraByte)
        }
        
        return "0K"
        
    }
}
