//
//  Session.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/7.
//

import Foundation
class Session: BaseModel {
    //用户的ID
    var user: String!
    
    //登录的标志符
    var session: String!
    
    var im_token: String?
    
    
}
