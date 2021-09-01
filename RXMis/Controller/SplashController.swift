//
//  SplashController.swift
//  RXMis
//第二个启动界面：例如可以添加用户是否登录，从而跳转到不同的界面，等业务场景
//  Created by 杨洋 on 2021/8/31.
//

import UIKit

class SplashController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.next()
        }
    }
    
    
    func next()  {
        print("SplashController next")
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.toGuide()
        AppDelegate.sharde.toGuide()
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
