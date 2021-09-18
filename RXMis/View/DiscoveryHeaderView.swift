//
//  DiscoveryHeaderView.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/10.
//

import UIKit

class DiscoveryHeaderView: BaseCollectionReusableView {
    static let NAME = "DiscoveryHeaderView"
    ///banner点击
    var onBannerClick:((_ postion: Int) -> Void)?
    
    @IBOutlet weak var bannerView: YJBannerView!
    
    //轮播图的数据
    var dataArr: [String] = []
    
    @IBOutlet weak var lbDay: UILabel!
    /// 当系统创建这个Nib的时候
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    override func initViews() {
        super.initViews()
        //设置轮播图圆角
        ViewUtil.showSmallRadius(bannerView)
        
        initBannerView()
    }
    
    override func initDatas() {
        super.initDatas()
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let time = formatter.string(from: now)
        lbDay.text=time
    }

    
    /// 初始化轮播图组件
    func initBannerView() {
        //初始化轮播图组件
        //这是轮播图的数据库为当前类
        bannerView.dataSource = self
        bannerView.delegate = self
        
        //设置如果显示的图片为空(找不到图片)显示的图片
         bannerView.emptyImage = UIImage (named: IMAGE_PLACE_HOLDER)
        
        //设置占位图，就是图片还是下载下来前显示的图片
         bannerView.placeholderImage=UIImage (named: IMAGE_PLACE_HOLDER)
        
        //该方法是SDWebImage框架中的方法
         bannerView.bannerViewSelectorString="sd_setImageWithURL:placeholderImage:"
        
        //禁用自动滚动
        //bannerView.autoScroll=false
        //重新载入数据
         bannerView.reloadData()
    }
    
    //显示数据
    func bindData(_ data: [Ad]) {
        dataArr.removeAll()
        for ad in data {
            dataArr.append(ResourceUtil.resourceUri(ad.banner!))
        }
        bannerView.reloadData()
        
    }
    
    // MARK: - 快捷按钮点击事件
    @IBAction func onDayClick(_ sender: UIButton) {
        print("DiscoveryHeaderView onclick")
    }
    
    @IBAction func onListClick(_ sender: UIButton) {
        print("DiscoveryHeaderView onListClick")
    }
    
    @IBAction func onFMClick(_ sender: UIButton) {
        print("DiscoveryHeaderView onFMClick")
    
    }
    
    @IBAction func onRankClick(_ sender: Any) {
        print("DiscoveryHeaderView onRankClick")
    }
    
}
extension DiscoveryHeaderView: YJBannerViewDelegate,YJBannerViewDataSource{
    func bannerViewImages(_ bannerView: YJBannerView!) -> [Any]! {
        return dataArr
    }
    
    func bannerView(_ bannerView: YJBannerView!, customCell: UICollectionViewCell!, index: Int) -> UICollectionViewCell! {
        let cell = customCell as!YJBannerViewCell
        cell.showImageViewContentMode = .scaleAspectFill
        return cell
    }
    
    func bannerView(_ bannerView: YJBannerView!, didSelectItemAt index: Int) {
         print("GuideController banner click:%d",index )
        if let callBack = onBannerClick{
            callBack(index)
        }
    }
    
}
