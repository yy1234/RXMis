//
//  LoginOrRegisterController.swift
//  RXMis
//  登录注册界面
//  Created by 杨洋 on 2021/9/2.
//

import UIKit

class LoginOrRegisterController: UIViewController {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
