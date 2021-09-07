//
//  BaseLoginController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/7.
//

import UIKit

class BaseLoginController: BaseCommonController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    /// 登录
    ///
    /// - Parameters:
    ///   - phone: <#phone description#>
    ///   - email: <#email description#>
    ///   - password: <#password description#>
    ///   - qq_id: <#qq_id description#>
    ///   - weibo_id: <#weibo_id description#>
    func login(phone:String?=nil,email:String?=nil,password:String?=nil,qq_id:String?=nil,weibo_id:String?=nil) {
        Api.shared.login(phone: phone, email: email, password: password).subscribeOnSuccess { data in
            if let data = data?.data {
                //登录成功
                print("RegisterController onRegisterClick login success:\(data.user)")

                //把登录成功的事件通知到AppDelegate
                AppDelegate.sharde.onLogin(data)
            }
            }.disposed(by: disposeBag)
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
