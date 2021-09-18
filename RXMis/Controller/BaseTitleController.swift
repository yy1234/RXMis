//
//  BaseTitleController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/9.
//

import UIKit

class BaseTitleController: BaseCommonController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func initViews() {
        super.initViews()
        setNavigationBarTintColor(UIColor.black)
    }
    
    /// 设置标题
    ///
    ///
    func setTitle(_ title:String) {
        self.navigationItem.title=title
        
    }
    
    /// 设置导航栏按钮文本颜色
    ///
    /// - Parameter color: <#color description#>
    func setNavigationBarTintColor(_ color:UIColor) {
        self.navigationController?.navigationBar.tintColor=color
    }
    
    /// 设置导航栏标题文本颜色
    ///
    /// - Parameter color: <#color description#>
    func setTitleTextColor(_ color:UIColor) {
        navigationController!.navigationBar.titleTextAttributes=[.foregroundColor:color]
        
     }
    
    /// 当前界面是否隐藏导航栏
    ///
    /// - Returns: true:隐藏，false:显示(默认) 4
    func hideNavigationBar() -> Bool {
        return false
    }
    /// - Parameter animated: <#animated description#>
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if hideNavigationBar() { //隐藏导航栏
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            
        }
        
    }
    
    ///
    ///will:即将
    ///did:已经
    ///其他方法命名也都有这个规律
    ///
    /// - Parameter animated: <#animated description#>
    override func viewWillDisappear(_ animated: Bool) {
        if hideNavigationBar() {
            //显示导航栏
            //显示导航栏，因为其他界面可能需要显示
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            
        }
    }
}
