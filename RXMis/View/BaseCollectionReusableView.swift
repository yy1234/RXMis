//
//  BaseCollectionReusableView.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/18.
//

import UIKit

class BaseCollectionReusableView: UICollectionReusableView {
    /// 当系统创建这个Nib的时候
    /// 就会调用这个方法
    /// 因为Nib关联了这个类
    override func awakeFromNib() {
        super.awakeFromNib()
        initViews()
        initDatas()
        initListeners()
    }
    ///初始化控件
    func initViews() {
        
    }
    /// 初始化数据
    func initDatas() {
        
    }
    /// 初始化监听器
    func initListeners() {
        
    }
}

