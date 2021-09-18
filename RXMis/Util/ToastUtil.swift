//
//  ToastUtil.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/3.
//

import UIKit

class ToastUtil {
    
    private static var hud:MBProgressHUD?
    
    //短的文字提示
    static func short(_ messsage: String){
        let hud = MBProgressHUD.showAdded(to: (AppDelegate.shared.window?.rootViewController!.view)!, animated: true)
        //只显示文字
        hud.mode = .text
        
        hud.bezelView.color = .black
        
        hud.detailsLabel.text = messsage;
        hud.detailsLabel.textColor = .white
        
        hud.hide(animated: true, afterDelay: 1.0)
        
    }
    ///显示一个加载对话框
     ///
     ///
    static func showLoading(_ message:String = "拼命加载中."){
        DispatchQueue.main.async {
            if let _ = hud {
                //已经显示了
                
                //就不在显示
                return
            }
            
            //创建一个MBProgressHUD
            hud=MBProgressHUD.showAdded(to: AppDelegate.shared.window!.rootViewController!.view, animated: true)
            
            //设置菊花颜色
            hud!.activityIndicatorColor=UIColor.white
            
            //设置背景模糊
            hud!.backgroundView.style=MBProgressHUDBackgroundStyle.solidColor
            
            //设置背景为半透明效果
            //UIColor(white: 0.0：表示创建一个黑色
            //0.1:表示黑色有透明效果，0：完全透明；1：完全不透明（黑色）
            hud!.backgroundView.color=UIColor(white: 0.0, alpha: 0.1)
            
            //小矩形的背景颜色
            hud!.bezelView.color=UIColor.black
            
            //细节文本
            hud!.detailsLabel.text=message
            
            //细节文本的颜色
            hud!.detailsLabel.textColor=UIColor.white
            
            //显示
            hud!.show(animated: true)
            
        }
 
 
    }
    

    /// 隐藏加载对话框
    static func hideLoading() {
        DispatchQueue.main.async {
            if let hu = hud {
                hu.hide(animated: true)
                ToastUtil.hud = nil
            }
        }
      
    }
}
