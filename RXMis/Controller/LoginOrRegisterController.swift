//
//  LoginOrRegisterController.swift
//  RXMis
//  登录注册界面
//  Created by 杨洋 on 2021/9/2.
//

import UIKit

class LoginOrRegisterController: UIViewController {
    //MARK: - 声明
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var btRegister: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //圆角
        ViewUtil.showLargerRadius(view: btLogin)
        ViewUtil.showLargerRadius(view: btRegister)
        
        //边框
        btLogin.showColorPrimaryBorder()
        btRegister.showColorPrimaryBorder()
        // Do any additional setup after loading the view.
    }
    //MARK: - 事件
    //按下
    @IBAction func touchDown(_ sender: UIButton) {
        sender.backgroundColor = UIColor(hex: COLOR_PRIMARY)
    }
    //抬起
    @IBAction func touchUp(_ sender: UIButton) {
        sender.backgroundColor = UIColor.white
        if sender == btLogin {
            toLogin()
        }else{
            toRegister()
        }
    }
    //按钮以外抬起
    @IBAction func tochUpOutSide(_ sender: UIButton) {
        touchUp(sender)
    }
    
    func toLogin()  {
        
    }
    
    func toRegister() {

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
