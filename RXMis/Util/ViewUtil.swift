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
    
    /// 显示小的圆角
    ///
    /// - Parameter view: <#view description#>
    static func showSmallRadius(_ view:UIView) {
        showRadius(view: view, Radius: Float(SIZE_SMALL_RADIUS))
    }
    
    //设置大圆角
    static func showRadius(view: UIView,Radius: Float) {
        view.layer.cornerRadius = CGFloat(Float(Radius))
        
        //裁剪多余的内容
        view.clipsToBounds = true
    }
    
}
