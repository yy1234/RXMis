//
//  GuideController.swift
//  RXMis
// 引导界面
//  Created by 杨洋 on 2021/8/31.
//

import UIKit

class GuideController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initBanner()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var bannerView: YJBannerView!
    @IBOutlet weak var fotter: UIView!
    @IBOutlet weak var btLoginORRegister: UIButton!

    @IBOutlet weak var btEnter: UIButton!
    
    
    func initBanner() {
        bannerView.delegate = self
        bannerView.dataSource = self
        
        bannerView.emptyImage = UIImage.init(named: IMAGE_PLACE_HOLDER)
        bannerView.placeholderImage = UIImage.init(named: IMAGE_PLACE_HOLDER)
        bannerView.bannerViewSelectorString = "sd_setImageWithURL:placeholderImage:"
        //指示器
        bannerView.pageControlAliment = .center
        bannerView.pageControlBottomMargin = 90
        bannerView.pageControlNormalColor = UIColor(hex: COLOR_LIGHT_GRAY)
        bannerView.pageControlHighlightColor = UIColor(hex: COLOR_PRIMARY)
        bannerView.autoScroll = false
        bannerView.reloadData()
    }
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
//MARK:事件
    @IBAction func onLoginOrRegisterClick(_ sender: UIButton) {
        print("GuideController onLoginOrRegisterClick")
        AppDelegate.sharde.toLoginOrRegister()
        setShowGuide()

    }
    
    
    
    @IBAction func onEnterClick(_ sender: UIButton) {
        print("GuideController onEnterClick")
        AppDelegate.sharde.toHome()
        setShowGuide()
    }
    
    //设置不显示引导引导界面
    func setShowGuide()  {
        PreferenceUtil.setShowGuide(isShowGuide: true)
    
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


extension GuideController:YJBannerViewDelegate,YJBannerViewDataSource {
    
    func bannerViewImages(_ bannerView: YJBannerView!) -> [Any]! {
        return ["Guide1","Guide2","Guide3","Guide4","Guide5"]
    }
    //自定义celll
    func bannerView(_ bannerView: YJBannerView!, customCell: UICollectionViewCell!, index: Int) -> UICollectionViewCell! {
        let cell = customCell as! YJBannerViewCell
        cell.showImageViewContentMode = .scaleAspectFill
        return cell
    }
    
    
}
