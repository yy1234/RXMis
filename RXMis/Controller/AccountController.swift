//
//  AccountController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/8.
//

import UIKit

class AccountController: BaseCommonController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup af ter loading the view.
    }
    
    @IBAction func onLayoutClick(_ sender: UIButton) {
        AppDelegate.shared.logout()
        
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
