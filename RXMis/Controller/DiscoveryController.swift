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
    var dataArray: [Any] = []
    
    
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
        //创建一个歌单Nib
        let sheetCell = UINib(nibName: SheetCell.NAME, bundle: nil)
        collectionView.register(sheetCell.self, forCellWithReuseIdentifier: SheetCell.NAME)
        //注册头部
        collectionView.register(UINib(nibName: DiscoveryHeaderView.NAME, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DiscoveryHeaderView.NAME)
        if DEBUG {
            collectionView.reloadData()
        }
        
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
        dataArray.append("这是标题1")
        for i in 1...10 {
        let sheet = Sheet()
            sheet.title = "这是歌单\(i)，标题很⻓⻓⻓⻓⻓⻓⻓⻓⻓⻓⻓⻓⻓⻓⻓⻓"
            dataArray.append(sheet)
        }
        dataArray.append("这是标题8")

        dataArray.removeAll()
        
        
        Api.shared.sheets().subscribeOnSuccess { data in
            if let data1 = data?.data?.data {
                self.dataArray.append("推荐歌单")
                self.dataArray = self.dataArray + data1
                self.collectionView.reloadData()
            }
        }.disposed(by: disposeBag)
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
    /// 获取列表类型
    ///
    /// - Parameter data: <#data description#>
    /// - Returns: <#return value description#>
    func typeForItemAtData(_ data:Any) -> CellType {
        if data is Sheet {
            //歌单
            return .sheet
        }
//        else if  data is Song {
//            //单曲
//            return .song
//        }
        
        //标题
        return .title
    }
    
    /// Cell类型
    /// 他是一个枚举
    /// 以后也可以重构
    /// 就是项目中所有的类型都用他
    ///
    /// - title: 标题
    /// - sheet: 歌单
    /// - song: 单曲
    enum CellType {
        case title
        
        case sheet
        
        case song
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
    /// 返回有多个条目
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = dataArray[indexPath.row]
        let type = typeForItemAtData(data)
        switch type {
        case .sheet:
            //歌单
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: SheetCell.NAME, for: indexPath) as! SheetCell
            let data = dataArray[indexPath.row]
            cell.bindData(data as! Sheet)
            return cell
        default:
            //默认是标题
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCell.NAME, for: indexPath) as! TitleCell
            let data = dataArray[indexPath.row]
            cell.bindData(data as! String)
            return cell

        }
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
        let collectionViewWidth = self.collectionView.frame.width
        //除以3，因为要显示3列
        //获取当前位置对应的数据
        let data = dataArray[indexPath.row]
        let type = typeForItemAtData(data)

        //最终的宽高
        var width: CGFloat!
        var height: CGFloat!
        
        switch type {
        case .sheet:
            //歌单
            //3列
            width=(collectionViewWidth - SIZE_LARGE_DIVIDER * 2) / 3
            
            //计算高度
            height = width + SIZE_LARGE_DIVIDER + SIZE_TITLE_HEIGHT + SIZE_LARGE_DIVIDER

        case .song:
            //单曲
            width = collectionViewWidth
            
            //5+110(图片高度)+5
            height = 110
        default:
            //标题
            width=collectionViewWidth
            height = SIZE_TITLE_HEIGHT
        }

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let collectionViewWidth=collectionView.frame.width
        return CGSize(width: collectionViewWidth, height: 270)
    }
    
}
