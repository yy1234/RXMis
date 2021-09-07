//
//  BaseCommonController.swift
//  RXMis
//  通用的业务控制器
//  Created by 杨洋 on 2021/9/7.
//

import UIKit
import RxSwift

class BaseCommonController: BaseController {
    //负责对象销毁
    //这个功能类似NotificationCenter的removeObserver
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
