//
//  Service.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/3.
//

import Foundation
import Moya
/// 定义项目中的所有接口
///
/// - sheetDetail: 歌单详情
/// - sheets: 歌单列表
/// - createUser: 创建用户
/// - resetPassword: 重置密码
/// - sendSMSCode: 发送验证码
/// - sendEmailCode: 发送邮件验证码
enum Service {
    case sheetDetail(id: String)
    case sheets
    case createUser(avatar:String?,nickname:String,phone:String,email:String,password:String,qq_id:String?,weibo_id:String?,wechat_id:String?)
    case login(phone:String?,email:String?,password:String?,qq_id:String?,weibo_id:String?,wechat_id:String?)
    case resetPassword(phone:String?,email:String?,code:String,password:String)
    case sendSMSCode(phone:String)
    case sendEmailCode(email:String)

}

extension Service: TargetType {
    //返回网址
    var baseURL: URL {
        return URL(string: ENDPOINT)!
    }
//    路径
    var path: String {
        switch self {
        case .sheets:
            return "/v1/sheets"
        case .sheetDetail(id: let id):
            return "/v1/sheets/\(id)"
        case .createUser:
            return "/v1/users"
        case .login:
            return "/v1/sessions"
        case .resetPassword:
            return "/v1/users/reset_password"
        case .sendSMSCode:
            return "/v1/codes/request_sms_code"
        case .sendEmailCode:
            return "/v1/codes/request_email_code"
        default:
            return ""
        }
    }
//    方法
    var method: Moya.Method {
        switch self {
        case .createUser,.login,.resetPassword,.sendSMSCode, .sendEmailCode:
            return .post
        default:
            return .get
        }
        
    }
//    测试相关的方法
    var sampleData: Data {
        return Data()
        
    }
//    请求的参数4816
    var task: Task {
        switch self {
        case .createUser(let avatar, let nickname, let phone, let email, let password, let qq_id, let weibo_id,let wechat_id):
            return .requestParameters(parameters: ["avatar":avatar,"nickname":nickname,"phone":phone,"email":email,"password":password,"qq_id":qq_id,"weibo_id":weibo_id,"wechat_id":wechat_id], encoding: JSONEncoding.default)
        case .login(let phone, let email, let password,let qq_id, let weibo_id,let wechat_id):
            return HttpUtil.jsonRequestParamters(["phone":phone ?? "","email": email ?? "","password" :password  ?? "","qq_id":qq_id  ?? "","weibo_id":weibo_id  ?? "","wechat_id":wechat_id  ?? ""])
        case .sendSMSCode(let phone):
            return HttpUtil.jsonRequestParamters(["phone":phone])
        case .sendEmailCode(let email):
            return HttpUtil.jsonRequestParamters(["email":email])
        default:
            return .requestPlain

        }
        //不传递参数
    }
//    请求头
    var headers: [String : String]? {
        return nil
    }
    
    
}
