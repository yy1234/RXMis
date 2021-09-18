//
//  DiscoveryController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/8.
//

import UIKit

class DiscoveryController: BaseCommonController {
    @IBOutlet weak var collectionView: UICollectionView!
    /// 当前界面头部布局
    var header: DiscoveryHeaderView!
    var bannerArray: [Ad] = []
    var dataArry: [Any] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
    }
    override func initViews() {
        super.initViews()
        navigationItem.title  = "发现"
        //创建一个Nib
        let titleCell = UINib(nibName: TitleCell.NAME, bundle: nil)
        collectionView.register(titleCell.self, forCellWithReuseIdentifier: TitleCell.NAME)
        //注册头部
        collectionView.register(UINib(nibName: DiscoveryHeaderView.NAME, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DiscoveryHeaderView.NAME)
        
    }
    
    override func initListenners() {
        super.initListenners()
        //添加一个通知监听器 //当用户点击了启动界面的广告 //就会在onAdClick方法中接收到
        NotificationCenter.default.addObserver(self, selector: #selector(onAdClick(notification:)), name: NSNotification.Name(rawValue: AD_CLICK), object: nil)
    }
    override func initDatas() {
        fechBanner()
        
        fechData()
    }
    
    //加载首页数据
    func fechData() {
        dataArry.append("这是标题1")
        dataArry.append("这是标题2")
        dataArry.append("这是标题3")
        dataArry.append("这是标题4")
        dataArry.append("这是标题5")
        dataArry.append("这是标题6")
        dataArry.append("这是标题7")
        dataArry.append("这是标题8")
        dataArry.append("这是标题9")
        collectionView.reloadData()
    }
    
    //获取轮播图数据
    func fechBanner() {
        Api.shared.ads().subscribeOnSuccess { result in
            if let data = result?.data?.data{
                self.showBannerData(data)
            }
             
        }.disposed(by: disposeBag)
    }
    
    func showBannerData(_ data: [Ad]){
        bannerArray = data
        header.bindData(data)
    }
    
    
    @objc func onAdClick(notification:NSNotification) {
        
        let uri = notification.userInfo!["uri"] as! String
        print("DiscoveryController onAdClick:\(uri)")
        
//        let controller = navigationController!.storyboard?.instantiateViewController(withIdentifier: "Web") as! WebController
//        //将传递过来的数据设置到controller中
//        controller.title = "活动详情"
//         controller.uri = uri
//        //将控制器压入导航控制中
//         navigationController!.pushViewController(controller, animated: true)
        
        WebController.start(self.navigationController!, "活动详情", uri)
        
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

extension DiscoveryController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArry.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCell.NAME, for: indexPath) as! TitleCell
        let data = dataArry[indexPath.row]
        cell.bindData(data as! String)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DiscoveryHeaderView.NAME, for: indexPath) as! DiscoveryHeaderView
        header.onBannerClick = {[weak self] position in
            guard let sSelf = self else { return}
            let data = sSelf.bannerArray[position]
            WebController.start(sSelf.navigationController!, data.title, data.uri)
        }
        return header
    }
    

    

}

extension DiscoveryController: UICollectionViewDelegateFlowLayout{
    /// 返回CollectionView里面的Cell到CollectionView的间距
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - collectionViewLayout: <#collectionViewLayout description#>
    ///   - section: <#section description#>
    /// - Returns: return value description
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    /// 返回每个Cell的行间距
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - collectionViewLayout: <#collectionViewLayout description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    /// 返回每个Cell的列间距
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - collectionViewLayout: <#collectionViewLayout description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    /// 返回当前Cell的大小
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - collectionViewLayout: <#collectionViewLayout description#>
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth=self.collectionView.frame.width
        //除以3，因为要显示3列
        //每列就是总宽度/3
        let width=(collectionViewWidth-10*2)/3
        return CGSize(width: collectionViewWidth, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let collectionViewWidth=collectionView.frame.width
        return CGSize(width: collectionViewWidth, height: 270)
    }
    
}
