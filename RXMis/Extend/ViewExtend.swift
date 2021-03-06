//
//  ViewExtend.swift
//  RXMis
//  对UIView的扩展类
//  Created by 杨洋 on 2021/9/1.
//

import UIKit

//MARK: -这里使用了swift的扩展语法
extension UIView {
    //显示
    func showColorPrimaryBorder() {
        self.layer.borderWidth = CGFloat(SIZE_BORDER)
        self.layer.borderColor = UIColor(hex: COLOR_PRIMARY).cgColor
    }
}
