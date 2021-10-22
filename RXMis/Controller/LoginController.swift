//
//  LoginController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/7.
//

import UIKit

class LoginController: BaseLoginController {

    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfLoginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func initViews() {
        super.initViews()
        navigationItem.title = "登录"
        tfUserName.showLeftIcon(name: "LoginItemPhone")
        tfPassword.showLeftIcon(name: "LoginItemPhone")

        ViewUtil.showLargerRadius(view: tfLoginBtn)
    }
    
    
    @IBAction func onLoginClick(_ sender: Any) {
        print("LoginController onLoginClick")
        
        //获取用户名
        let username = tfUserName.text!.trim()!
        
        if username.isEmpty {
            ToastUtil.short("请输入用户名！")
            return
        }
        
//        guard username.isPhone() || username.isEmail() else {
//            //如果用户名不是手机号
//            //如果用户名不是邮箱
//            ToastUtil.short("用户名格式不正确！")
//            return
//        }
        
        var isPhone = false
        if username.isPhone() {
            //手机号
            isPhone=true
        }else if username.isEmail() {
            //邮箱
            isPhone=false
        }else {
            ToastUtil.short("用户名格式不正确！")
            return
        }
        
        //获取密码
        let password=tfPassword.text!.trim()!
        
        if password.isEmpty {
            ToastUtil.short("请输入密码！")
            return
        }
        
        guard password.isPassword() else {
            ToastUtil.short(ERROR_PASSWORD_FORMAT)
            return
        }
        if isPhone {
            login(phone: tfUserName.text!, password: tfPassword.text!)

        }else{
            login(email: tfUserName.text!, password: tfPassword.text!)

        }
    }
//    func login(phone: String,passWord: String) {
//        Api.shared.login(phone: phone, password: passWord).subscribeOnSuccess { data in
//            if let data = data?.data{
//                AppDelegate.sharde.onLogin(data)
//            }
//        }.disposed(by: disposeBag)
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
