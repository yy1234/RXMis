//
//  Constant.swift
//  RXMis
//  主要用来声明字符串，颜色，尺寸
//  Created by 杨洋 on 2021/9/1.
//

import Foundation

//MARK:尺寸
//立即体验按钮的宽度
let SIZE_BUTTON_ENTER_WIDTH = 130.0
//立即体验按钮的高度
let SIZE_BUTTON_ENTER_HEIGTH = 44.0

//大圆角的半径
let SIZR_LARGER_RADIUS = SIZE_BUTTON_ENTER_HEIGTH / 2

//边框的宽度
let SIZE_BORDER = 1.0


//MARK:颜色
//程序的主色调
let COLOR_PRIMARY = 0xdd0000
//灰色
let COLOR_LIGHT_GRAY = 0xaaaaaa


//占位图
let IMAGE_PLACE_HOLDER = "PlaceHolder"

/// 手机号
/// 移动：134 135 136 137 138 139 147 150 151 152 157 158 159 178 182 183 184 187 188 198
/// 联通：130 131 132 145 155 156 166 171 175 176 185 186
/// 电信：133 149 153 173 177 180 181 189 199
/// 虚拟运营商: 170
let REGX_PHONE="^(0|86|17951)?(13[0-9]|15[012356789]|16[6]|19[89]]|17[01345678]|18[0-9]|14[579])[0-9]{8}$"

//邮箱正则表达式
let REGX_EMAIL="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
