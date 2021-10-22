//
//  WebController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/9.
//

import UIKit
import WebKit

class WebController: BaseCommonController {

    var uri: String!
    
    @IBOutlet weak var wv: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func initViews() {
        wv.uiDelegate = self
        wv.navigationDelegate = self
    }
    
    override func initDatas() {
        super.initDatas()
        //将字符串创建为URL
        let url = URL(string: uri)!
        //创建request
        let request = URLRequest(url: url)
        //使用WebView加载
        wv.load(request)
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

extension WebController: WKUIDelegate{
    
}

extension WebController: WKNavigationDelegate{
    
}
