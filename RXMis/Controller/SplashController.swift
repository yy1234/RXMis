//
//  SplashController.swift
//  RXMis
//第二个启动界面：例如可以添加用户是否登录，从而跳转到不同的界面，等业务场景
//  Created by 杨洋 on 2021/8/31.
//

import UIKit

class SplashController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            self.next()
        }
    }
    
    func next()  {
        print("SplashController next")
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.toGuide()
        if PreferenceUtil.isShowGuide() {
            AppDelegate.sharde.toGuide()
        }else if(PreferenceUtil.isLogin()){
            //已经登陆了
             //就显示广告⻚面;在广告⻚面再进入主界面
             //可以根据自己的需求来更改
             //同时只有用户登陆了
             //才显示也给用户有更好的体验
            AppDelegate.sharde.toAdd()
        }else{
            AppDelegate.sharde.toLoginOrRegister()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
