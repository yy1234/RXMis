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
    func logout() {
        
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

