//
//  RegisterController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/3.
//

import UIKit

class RegisterController: BaseController {

    //MARK: - 声明
    @IBOutlet weak var thNickName: UITextField!
    
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfComfirmPassword: UITextField!
    @IBOutlet weak var btRegister: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func initViews() {
        super.initViews()
        setUpUI()
    }
    
    func setUpUI() {
        ViewUtil.showLargerRadius(view: btRegister)
        thNickName.showLeftIcon(name: "LoginItemPhone")
        tfPhone.showLeftIcon(name: "LoginItemPhone")
        tfPassword.showLeftIcon(name: "LoginItemPhone")
        tfComfirmPassword.showLeftIcon(name: "LoginItemPhone")

        

    }
    //MARK: - 事件

    @IBAction func registerClick(_ sender: Any) {
       
        let nickName = thNickName.text!.trim()!
        if nickName.isEmpty {
            ToastUtil.short("昵称不能为空")
            return
        }
        guard nickName.isNickname() else {
            ToastUtil.short("昵称长度不对！")
            return
        }
        //        //获取到手机号
                let phone=tfPhone.text!.trim()!

        //        //去掉前后的空白字符
        //        phone=phone.trimmingCharacters(in: whitespace)
        //
                if phone.isEmpty {
                    ToastUtil.short("请输入手机号！")
                    return
                }

                //使用重构后的方法

                //判断昵称格式
        //        if !nickname.isNickname() {
        //            ToastUtil.short("昵称长度不对！")
        //            return
        //        }

        //判断手机号格式
        guard phone.isPhone() else {
            ToastUtil.short("手机号格式不正确！")
            return
        }
        
        
        //获取邮箱
        let email=tfEmail.text!.trim()!
        
        //为空判断
        if email.isEmpty {
            ToastUtil.short("请输入邮箱！")
            return
        }
        
        //判断邮箱格式
        guard email.isEmail() else {
            ToastUtil.short("邮箱格式不正确！")
            return
        }
        
        //密码
        let password=tfPassword.text!.trim()!
        
        if password.isEmpty {
            ToastUtil.short("请输入密码！")
            return
        }
        
        guard password.isPassword() else {
            //            ToastUtil.short("密码格式不正确！")
            ToastUtil.short(ERROR_PASSWORD_FORMAT)
            return
        }
        //确认密码
        let confirmPassword=tfComfirmPassword.text!.trim()!

        if confirmPassword.isEmpty {
            ToastUtil.short("请输入确认密码！")
            return
        }

        guard confirmPassword.isPassword() else {
            ToastUtil.short("确认密码格式不正确！")
            return
        }

        //判断确认密码和密码是否一样
        guard password==confirmPassword else {
            ToastUtil.short("两次密码不一致！")
            return
        }
    }
    
    @IBAction func onAgreeMentClick(_ sender: Any) {
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
