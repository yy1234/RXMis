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
