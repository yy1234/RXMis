//
//  ForgetPasswordController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/8.
//

import UIKit

class ForgetPasswordController: BaseLoginController {

    @IBOutlet weak var tfUserName: UITextField!
 
    
    @IBOutlet weak var btSentCode: UIButton!
    
    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConformPassword: UITextField!
    @IBOutlet weak var btResetPassWord: UIButton!
    var countDown: CountDown!
    
    deinit {
        countDown.destoryTimer()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func initViews() {
        navigationItem.title = "找回密码"
        super.initViews()
//        ViewUtil.showLargerRadius(view: btResetPassWord)
    }
    override func initDatas() {
        super.initDatas()
        countDown = CountDown()
    }
    override func initListenners() {
        super.initListenners()
        
    }
    
    func startCountDown() {
        //开始时间
        let startDate=Date()
        
        //结束时间
        //当前时间+60秒
        let endDate=Date(timeIntervalSinceNow: 60)
        
        //禁用按钮点击
        btSentCode.isEnabled=false
        
        //启动倒计时
        countDown.countDown(withStratDate: startDate, finish: endDate) { (day, hour, minute, second) in
            
            //计算剩余秒数
            let totalSecond=day*24*60*60+hour*60*60+minute*60+second
            
            if totalSecond == 0 {
                //倒计时完毕了
                self.btSentCode.setTitle("发送验证码", for: .normal)
                self.btSentCode.isEnabled=true
            }else {
                //正在倒计时
                self.btSentCode.setTitle("(\(totalSecond))秒", for: .normal)
            }
        }
    }
    
    @IBAction func onSendCodeClick(_ sender: UIButton) {
        //        startCountDown()
        
        //获取用户名
        let username = tfUserName.text!.trim()!
        
        if username.isEmpty {
            ToastUtil.short("请输入用户名！")
            return
        }
        
        //判断用户名格式
        if username.isPhone() {
            //手机号
            sendSMSCode(username)
        } else if username.isEmail() {
            //邮箱
            sendEmailCode(username)
        }else {
            ToastUtil.short("用户名格式不正确！")
        }
        
    }
    
    @IBAction func onRestPasswordClick(_ sender: UIButton) {
        //获取用户名
        let username=tfUserName.text?.trim()
        if username!.isEmpty { ToastUtil.short("请输入用户名!")
            return
        }
        guard username!.isPhone() || username!.isEmail() else {
            //如果用户名，既不是手机号
        //也不是邮箱，就是格式错误
           ToastUtil.short("用户名格式不正确!")
        return
        }
        //获取验证码
        let code=tfCode.text?.trim()
        if code!.isEmpty {
            ToastUtil.short("请输入验证码!")
            return
        }
        guard code!.isCode() else {
            ToastUtil.short("验证码格式不正确!")
            return
        }
        //获取密码
        let password=tfPassword.text?.trim()
        if password!.isEmpty {
            ToastUtil.short("请输入密码!")
            return
        }
        
        guard password!.isPassword() else {
            ToastUtil.short("密码格式不正确!")
            return
        }
        //确认密码
        let confirmPassword=tfConformPassword.text!.trim()
        
        if confirmPassword!.isEmpty{
            ToastUtil.short("请输入确认密码!")
            return
            
        }
        //确认密码判断
        guard password==confirmPassword else {
            ToastUtil.short("两次密码不正确!")
            return }
        
        
        //判断当前用户名是手机号 //还是邮箱
        var phone:String?
        var email:String?
        //判断是手机号还是邮箱
        if username!.isPhone(){
            //手机号
            phone=username
            
        }else{
            //邮箱
            email=username
        }
        
        
        Api.shared.resetPassword(phone: phone, email: email, code: code!, password: password!).subscribeOnSuccess { result in
            self.login(phone: phone, email: email, password: password)
        }
        
    }
    func sendSMSCode(_ username:String) {
        Api.shared.sendSMSCode(phone: username).subscribeOnSuccess { _ in
            //发送成功
            
            //开始倒计时
            self.startCountDown()
        }.disposed(by: disposeBag)
    }
    
    /// 发送邮件验证码
    ///
    /// - Parameter email: <#email description#>
    func sendEmailCode(_ email:String) {
        Api
            .shared
            .sendEmailCode(email: email)
            .subscribeOnSuccess { _ in
            //发送成功
            
            //开始倒计时
            self.startCountDown()
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
