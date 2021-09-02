//
//  ViewUtil.swift
//  RXMis
// View相关的工具类，圆角边框
//  Created by 杨洋 on 2021/9/1.
//

import UIKit
class ViewUtil {
    //设置大圆角
    static func showLargerRadius(view: UIView) {
        view.layer.cornerRadius = CGFloat(SIZR_LARGER_RADIUS)
        
        //裁剪多余的内容
        view.clipsToBounds = true
    }
    
  
    
}
