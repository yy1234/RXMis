//
//  RegisterController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/3.
//

import UIKit
import RxSwift
import Moya

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
        //使用网络指示器插件
        let networkActivityPlugin = NetworkActivityPlugin { changeType, TargetType in
            //changeType就是 NetworkActivityChangeType
            //TargetType就是我们自定义的Service
            if changeType == .began{
                print("开始请求了")
                ToastUtil.showLoading()
            }else{
                print("就是了请求了")
                ToastUtil.hideLoading()
            }
            
        }
        let provide = MoyaProvider<Service>(plugins:[NetworkLoggerPlugin(),networkActivityPlugin])
//        provide.request(.sheetDetail(id: "1")) { result in
//            switch result {
//            case .success(let response):
//                let data = response.data
//                let code =  response.statusCode
//                let dataString = String(data: data, encoding: .utf8)
//                print("response" + dataString!)
//            case .failure(let error):
//
//            print("请求失败\(error)")
//            default: break
//
//            }
//        }
        provide.rx.request(.sheetDetail(id: "1")).asObservable().mapString().mapObject(SheetWraper.self).subscribe { event in
            if let data = event.element{
             print("data")
            }
        }
    
        return;
        provide.request(.sheetDetail(id: "1")) { event in
            switch event {
            case .success(let response):
                let data = response.data
                let dataString = String(data: data, encoding: .utf8)
                print("response" + dataString!)
            case .failure(let error):
                switch error {
                case .imageMapping( _):
               print("图片解析错误")
                case .jsonMapping( _):
               print("json解析错误")
                case .statusCode( _):
                print("json解析错误")
                case .stringMapping( _):
                print("字符串映射错误")
                case .underlying(let nsError as NSError, _):
                print("错误转换成了error")
                    switch nsError.code {
                    case NSURLErrorNotConnectedToInternet:
                        print("网络不太好，请稍后再试！")
                    case NSURLErrorTimedOut:
                        print("连接超时，请稍后再试！")
                    default:
                        print("未知错误，请稍后再试！")
                    }
                case .objectMapping(_, _):
                    print("对象编码错误")
                case .encodableMapping(_):
                    print("")
                case .requestMapping(_):
                    print("")

                case .parameterEncoding(_):
                    print("")

                }
            print("请求失败\(error)")
    
                
            }
        }
        
        
       
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
