//
//  TextFieldzExtend.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/3.
//

import UIKit

extension UITextField {
    func showLeftIcon(name: String) {
        leftView = UIImageView.init(image: UIImage.init(named: name))
        leftViewMode = .always
    }
}
