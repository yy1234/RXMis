//
//  AppDelegate.swift
//  RXMis
//
//  Created by 杨洋 on 2021/8/3.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
            #endif
//        window = UIWindow.init(frame: UIScreen.main.bounds)
//        window?.backgroundColor = .white
//        let nav = UINavigationController.init(rootViewController: ExampleListViewController())
//        window?.rootViewController = nav
//        window?.makeKeyAndVisible()
        
        initSharedSDK()
        return true
    }

   
    //定义一个静态的计算的属性
    //返回AppDelegate对象实例,有class就是计算的静态属性，没有的话，就是实例属性
    open class var sharde : AppDelegate{
        get {
            return UIApplication.shared.delegate as!AppDelegate
        }
    }
    
    func setRootController(name: String){
        //获取到main.storyBoard
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainStoryBoard.instantiateViewController(identifier: name)
        window?.rootViewController = controller

    }
    
    
    /// 初始化SharedSDK
    func initSharedSDK() {
        ShareSDK.registPlatforms { register in
            //设置微信信息
//            register?.setupWeChat(withAppId: WECHAT_APP_ID, appSecret: WECHAT_APP_SECRET, universalLink: APP_UNIVERSAL_LINK)
            
            //设置QQ信息
//            register?.setupQQ(withAppId: QQ_APP_ID, appkey: QQ_APP_SECRET)
            
            //配置微博
//            register?.setupSinaWeibo(withAppkey: WEIBO_APP_KEY, appSecret: WEIBO_APP_SECRET, redirectUrl: WEIBO_REDIRECT_URI, universalLink: APP_UNIVERSAL_LINK)
            
        }
    }
    // MARK: - 用户相关
    /// 退出方法
    //    用户登出
    func logout() {
        
        //如果需要调用退出接口
        //就在这里调用就行了
        
        //清除用户信息
        PreferenceUtil.logout()
        
        //清除第三方登录的token
        //清除微信
        ShareSDK.cancelAuthorize(.typeWechat, result: nil)
        
        //清除QQ
        ShareSDK.cancelAuthorize(.typeQQ, result: nil)
        
        //清除微博
        ShareSDK.cancelAuthorize(.typeSinaWeibo, result: nil)
        
        //跳转到登录注册页面
        toLoginOrRegister()
        
        
    }
    func toAdd()  {
        setRootController(name: "Ad")

    }
    //用户登入
    func onLogin(_ data: Session) {
//        保存用户信息
        PreferenceUtil.setUserId(data.user)
        PreferenceUtil.setUserToken(data.session)
        
        //跳转到首页
        toHome()
    }
    //跳转到引导界面
    func toGuide()  {
    
        setRootController(name: "Guide")
    }
    
    func toLoginOrRegister() {
        //获取到main.storyBoard
//        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//
//    //实例化控制器
//        let loginOrRegister = mainStoryBoard.instantiateViewController(identifier: "LoginOrRegister")
//
//        window?.rootViewController = loginOrRegister
        setRootController(name: "LoginOrRegisterNavigation")

    }
    
    func toHome() {
        //获取到main.storyBoard
//        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//
//    //实例化控制器
//        let homeViewController = mainStoryBoard.instantiateViewController(identifier: "Home")
//        window?.rootViewController = homeViewController
        
        setRootController(name: "Home")

    }
}

