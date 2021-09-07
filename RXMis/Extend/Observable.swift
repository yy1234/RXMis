//
//  Observable.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/5.
// 对Observable进行扩展
//添加解析的对象的方法

import Foundation
import RxSwift
//import Moya
import HandyJSON
public enum IxueaError: Swift.Error {
    case obectMapping
}
extension  Observable {
    /// 将字符串解析为对象
    ///
    /// - Parameter type: 要转为的类
    /// - Returns: 转换后的观察者对象
    public func mapObject<T: HandyJSON>(_ type: T.Type) -> Observable<T?> {
        
        return self.map { data in
            //将参数尝试转为字符串
            guard let dataString = data as? String else {
                //data不能转为字符串
                return nil
            }
            
            if dataString.isEmpty {
                //空字符
                //也返回nil
                return nil
            }
            
            guard let result = type.deserialize(from: dataString) else {
                //转为对象失败
                throw IxueaError.obectMapping
            }
            
            //解析成功
            //返回解析后的对象
            return result
        }
        
    }
}

//http网络请求观察者
public class HttpObserver<Element>: ObserverType {
    
    /// ObserverType协议中用到了泛型E
    /// 所以说子类中就要指定E这个泛型
    /// 不然就会报错
    public typealias E = Element
    /// 请求成功回调
    var onSuccess: ((E) -> Void)
    /// 请求失败回调
    var onError: ((BaseResponse?,Error?) -> Bool)?
    
    /// 构造方法
    ///
    /// - Parameters:
    ///   - onSuccess: 请求成功的回调
    ///   - onError: 请求失败的回调
    init(_ onSuccess: @escaping ((E) -> Void),_ onError: ((BaseResponse?,Error?) -> Bool)? ) {
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
    

    
    /// 当RxSwift框架里面发送了事件回调
    ///
    /// - Parameter event: <#event description#>
    public func on(_ event: Event<Element>) {
        switch event {
        case .next(let value):
            //next事件
            print("HttpObserver next:\(value)")
            
            //将值尝试转为BaseResponse
            let baseResponse = value as? BaseResponse
            
            if baseResponse?.status != 0{
                //状态码不等于0
                //表示请求出错了
                requestErrorHandler(baseResponse:baseResponse)
            }else {
                //请求正常
                onSuccess(value)
            }
        case .error(let error):
            //请求失败
            print("HttpObserver error:\(error)")
            
            //处理错误
            requestErrorHandler(error:error)
            
        case .completed:
            //请求完成
            print("HttpObserver completed")
        }
        
        
        
    }
    
    /// 处理请求错误
    ///
    /// - Parameters:
    ///   - baseResponse: 请求返回的对象
    ///   - error: 错误信息
    func requestErrorHandler(baseResponse:BaseResponse?=nil,error:Error?=nil) {
        if onError != nil && onError!(baseResponse,error) {
            //回调了请求失败方法
            //并且该方法返回了true
            
            //返回true就表示外部手动处理错误
            //那我们框架内部就不用做任何事情了
        } else {
            //要自动处理错误
            HttpUtil.handlerRequest(baseResponse:baseResponse,error:error)
        }
    }
    
    
}

//扩展 ObservableType
//目的是添加2个自定义方法

extension ObservableType {
    //即关注成功，也关注失败的放法
    func subscribe(_ onSuccess: @escaping ((Element) -> Void),_ onError: @escaping ((BaseResponse?,Error?)-> Bool)) -> Disposable {
        //创建一个Disposable
        let disposable = Disposables.create()
        
        //创建一个HttpObserver
        let observer = HttpObserver<Element>(onSuccess,onError)
        
        
        //创建并返回一个Disposables
        return Disposables.create(self.asObservable().subscribe(observer),disposable)
    }
    
//    只关注成功
    func subscribeOnSuccess(_ onSuccess: @escaping ((Element) -> Void)) -> Disposable {
        let disposable = Disposables.create()
        
        let observer = HttpObserver<Element>(onSuccess,nil)
        
        return Disposables.create(self.asObservable().subscribe(observer),disposable)
    }
    
}

