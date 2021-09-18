//
//  HttpUtil.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/7.
//

import Foundation
import Moya
import Alamofire
class HttpUtil {
    
    /// 处理网络请求错误
    ///
    /// - Parameters:
    ///   - baseResponse: <#baseResponse description#>
    ///   - error: <#error description#>
    static func handlerRequest(baseResponse:BaseResponse?=nil,error:Error?=nil) {
        print("HttpUtil handlerRequest:\(baseResponse),\(error)")
        
        if let error = error as? MoyaError {
            //有错误
            //error类似就是Moya.MoayError
            switch error {
            case .imageMapping(let response):
                print("HttpUtil handlerRequest imageMapping:\(response)")
                
            case .stringMapping(let response):
                ToastUtil.short("响应转为字符串错误，请稍后再试！")
                
            case .statusCode(let response):
                //响应码
                let code=response.statusCode
                
                switch code {
                case 401:
                    //表示要登录
                    AppDelegate.shared.onLogout()
                    
                    //弹出提示
                    ToastUtil.short("登录信息过期，请重新登录！")
                case 403:
                    ToastUtil.short("你没有权限访问！")
                case 404:
                    ToastUtil.short("你访问的内容不存在！")
                case 500...599:
                    ToastUtil.short("服务器错误，请稍后再试！")
                    
                default:
//                    ToastUtil.short("未知错误，请求稍后再试！")
                    HttpUtil.showUnknowError()
                }
                
            case .underlying(let nsError as NSError,_):
                //这里直接判断nsError.code有问题
                //目前也没找到好的解决方法，暂时用这个方法解决：https://github.com/Moya/Moya/issues/2059
                //NSError错误code对照表：https://www.jianshu.com/p/9c9f14d25572
                if let alamofireError = error.errorUserInfo["NSUnderlyingError"] as? Alamofire.AFError,
                   let underlyingError = alamofireError.underlyingError as NSError?{
                    switch underlyingError.code {
                    case NSURLErrorNotConnectedToInternet:
                        //没有网络连接，例如：关闭了网络
                        ToastUtil.short("你的网络好像不太好")
                        break
                    case NSURLErrorTimedOut:
                        //连接超时，例如：网络特别慢
                        ToastUtil.short("连接服务器失败")
                        break
                    case NSURLErrorCannotFindHost:
                        //域名无法解析，例如：域名写错了
                        ToastUtil.short("找不到对应的主机")
                        break
                    case NSURLErrorCannotConnectToHost:
                        //无法连接到主机，例如：解析的ip地址，或者直接写的ip地址无法连接
                        ToastUtil.short("服务器连接失败")
                        break
                    default:
                        HttpUtil.showUnknowError()
                        break
                    }
                }else{
                    HttpUtil.showUnknowError()
                }
                
//                switch nsError.code {
//                case NSURLErrorNotConnectedToInternet:
//                    ToastUtil.short("网络好像不太好，请求稍后再试！")
//                case NSURLErrorTimedOut:
//                    ToastUtil.short("连接超时，请稍后再试！")
//                default:
////                    ToastUtil.short("未知错误，请稍后再试！")
//                    HttpUtil.showUnknowError()
//                }
                
            case .requestMapping:
                ToastUtil.short("请求映射错误，请稍后再试！")
                 
            case .objectMapping(_, _):
                ToastUtil.short("对象映射错误，请稍后再试！")
            case .parameterEncoding(_):
                ToastUtil.short("参数格式错误，请稍后再试！")
                
            default:
                print("HttpUtil handlerRequest other error")
            }
        }else {
            //业务错误
            if let baseResponse = baseResponse {
                if let message = baseResponse.message {
                    //有错误提示
                    ToastUtil.short(message)
                }else {
                    //没有错误提示
                    HttpUtil.showUnknowError()
                }
            }else {
                HttpUtil.showUnknowError()
            }
        }
        
        
    }
    
    /// 返回JSON编码的参数
    ///
    /// - Parameter parameters: 要编码的参数
    /// - Returns: 编码后的Task
    static func jsonRequestParamters(_ parameters:[String:Any]) -> Task {
        return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
    }
    
    /// 显示未知错误
    static func showUnknowError() {
        ToastUtil.short("未知错误，请稍后再试！")
    }
    
}
