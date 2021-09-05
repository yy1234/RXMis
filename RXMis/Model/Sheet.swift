//
//  Sheet.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/5.
//

import Foundation
import HandyJSON
class Sheet: HandyJSON{
    /// 歌单Id
    var id:String!
    
    /// 标题
    var title:String!
    
    /// 封面
    var banner:String?
    
    /// 描述
    var description:String?
    
    /// 点击数
    var clicks_count:Int = 0
    
    /// 收藏数
    var collections_count = 0
    
    /// 评论数
    var comments_count = 0
    
    /// 音乐数
    var songs_count = 0
    
    required init() {}

}
