//
//  Constant.swift
//  RXMis
//  主要用来声明字符串，颜色，尺寸
//  Created by 杨洋 on 2021/9/1.
//

import Foundation
// MARK: - 开发环境
/// 网络接口的地址
///Rails课程API端点
//let ENDPOINT="http://dev-my-cloud-music-api-rails.ixuea.com"

/// SpringBoot课程API地址
let ENDPOINT = "http://my-cloud-music-api-sp-dev.ixuea.com"

/// 资源接口地址
let RESOURCE_ENDPOINT = "http://dev-courses-misuc.ixuea.com"
/// 是否是调试模式
let DEBUG = true

//MARK:尺寸
//立即体验按钮的宽度
let SIZE_BUTTON_ENTER_WIDTH = 130.0
//立即体验按钮的高度
let SIZE_BUTTON_ENTER_HEIGTH = 44.0

//大圆角的半径
let SIZR_LARGER_RADIUS = SIZE_BUTTON_ENTER_HEIGTH / 2
//小圆角
let SIZE_SMALL_RADIUS = 5
//边框的宽度
let SIZE_BORDER = 1.0


//MARK:颜色
//程序的主色调
let COLOR_PRIMARY = 0xdd0000
//灰色
let COLOR_LIGHT_GRAY = 0xaaaaaa


//占位图
let IMAGE_PLACE_HOLDER = "PlaceHolder"


/// 密码格式不正确
let ERROR_PASSWORD_FORMAT = "密码格式不正确！"

/// 手机号
/// 移动：134 135 136 137 138 139 147 150 151 152 157 158 159 178 182 183 184 187 188 198
/// 联通：130 131 132 145 155 156 166 171 175 176 185 186
/// 电信：133 149 153 173 177 180 181 189 199
/// 虚拟运营商: 170
let REGX_PHONE="^(0|86|17951)?(13[0-9]|15[012356789]|16[6]|19[89]]|17[01345678]|18[0-9]|14[579])[0-9]{8}$"

//邮箱正则表达式
let REGX_EMAIL="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"



// MARK: - QQ第三方登录，分享
let QQ_APP_ID = "101481482"
let QQ_APP_SECRET = "b4304961e7299dde6b7b6964bfbb4a7f"

// MARK: - 新浪微博登录，分享
let WEIBO_APP_KEY = "1638318172"
let WEIBO_APP_SECRET = "5e265999bb4eb7c3c1eed34d658e0b0e"
let WEIBO_REDIRECT_URI = "http://www.ixuea.com"



/// 广告点击了发送的事件
let AD_CLICK = "AD_CLICK"
