//
//  GuideController.swift
//  RXMis
// 引导界面
//  Created by 杨洋 on 2021/8/31.
//

import UIKit

class GuideController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var fotter: UIView!
    @IBOutlet weak var btLoginORRegister: UIButton!

    @IBOutlet weak var btEnter: UIButton!
    
    //当布局完成后，调用的方法
    override func viewDidLayoutSubviews() {
        let width: CGFloat = CGFloat(SIZE_BUTTON_ENTER_WIDTH)
        let height: CGFloat = CGFloat(SIZE_BUTTON_ENTER_HEIGTH)

        //按钮的Y轴
        let btnY = (fotter.frame.height - height) / 2
        //按钮的X轴
        let btnLoginOrRegisterX = (fotter.frame.width-(width*2))/3
        
        btLoginORRegister.frame = CGRect(x: btnLoginOrRegisterX, y: btnY, width: width, height: height)
        
        //立即体验的X
        let btEnterX = btnLoginOrRegisterX * 2 + width
        btEnter.frame = CGRect(x: btEnterX, y: btnY, width: width, height: height)
        
        //设置圆角
        ViewUtil.showLargerRadius(view: btLoginORRegister);
        ViewUtil.showLargerRadius(view: btEnter);

        btEnter.showColorPrimaryBorder()
        
//        btEnter.layer.borderColor = UIColor(red: 211/255, green: 0, blue: 0, alpha: 1.0).cgColor
//        btEnter.layer.borderWidth = 1
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
