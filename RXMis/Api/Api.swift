//
//  Api.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/6.
//

import Foundation
import RxSwift
import HandyJSON
import Moya

class Api {
    /// 单例设计模式
    /// 饿汉式单例
    static let shared = Api()
    /// MoyaProvider
    private let provider:MoyaProvider<Service>!
    
    var plugins: [PluginType] = []
    
    /// 私有构造方法
    private init() {
        if DEBUG {
            plugins.append(NetworkLoggerPlugin())
        }
        //网络请求加载对话框
        let networkActivityPlugin = NetworkActivityPlugin { (changeType, targetType) in
            
            //changeType类型是NetworkActivityChangeType
            //通过它能监听到开始请求和结束请求
            
            //targetType类型是TargetType
            //就是我们这里的service
            //通过它能判断是那个请求
            
            
            if changeType == .began {
                //开始请求
                
                let targetType = targetType as! Service
                
                switch targetType {
                case .sheetDetail,.sheets:
                    ToastUtil.showLoading()
                    
                    
                default:
                    break
                }
            }else {
                //结束请求
                ToastUtil.hideLoading()
            }
            
            
        }
        plugins.append(networkActivityPlugin)
        //插件列表
        provider = MoyaProvider<Service>(plugins: plugins)
    }
    //歌单列表
    func sheets() -> Observable<ListResponse<Sheet>?> {
        return provider
            .rx.request(.sheets)
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(ListResponse<Sheet>.self)
    }
    
    //歌单详情
    func sheetDetail(id: String) -> Observable<DetailResponse<Sheet>?> {
        return provider.rx.request(.sheetDetail(id: id)).filterSuccessfulStatusCodes().asObservable().mapString().mapObject(DetailResponse<Sheet>.self)

    }
}
