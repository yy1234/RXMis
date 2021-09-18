//
//  AdController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/9.
//

import UIKit

class AdController: BaseCommonController {

    @IBOutlet weak var btSkipAd: UIButton!
    var task: DispatchWorkItem!
    var adUri: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func initViews() {
        super.initViews()
        ViewUtil.showRadius(view: btSkipAd, Radius: 15)
    }
    override func initDatas() {
        super.initDatas()
       task = DispatchWorkItem{
            self.next()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: task)
    }
    func next() {
        
        AppDelegate.shared.toHome(adUri)
    }
    @IBAction func onSkipAdClick(_ sender: UIButton) {
        task.cancel()
        next()
    }
    
    @IBAction func onAdClick(_ sender: UIButton) {
        adUri = "http://www.ixuea.com"
        
        onSkipAdClick( sender)
        
    }
    
    
    
    //状态栏样式
    //只有在没有导航栏才可以使用如下方法更改:
    override var preferredStatusBarStyle: UIStatusBarStyle{
        //内容为白色
        return .lightContent
        
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
