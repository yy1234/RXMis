//
//  BaseController.swift
//  RXMis
//  通用控制器
//  Created by 杨洋 on 2021/9/3.
//

import UIKit
import RxSwift

class BaseController: UIViewController {

    
    //MARK: - 方法
    @objc func injected(){
        initViews()


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        initDatas()
        initListenners()
    }
    
    func initViews() {
    
    }
    
    func initDatas(){
        
    }

    func initListenners()  {
    
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
