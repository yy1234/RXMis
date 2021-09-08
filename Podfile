# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RXMis' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RXMis
  #pod 'SwiftLint', '= 0.41.0', configurations: ['Debug']
  pod 'DesignKit', :path => './Frameworks/DesignKit', :inhibit_warnings => false
  pod 'Reveal-SDK', '~> 24', :configurations => ['Debug']
  pod 'YogaKit', '~> 1.18.1'
  pod 'SnapKit', '~> 5.0.0'
  # 提示框架
  #https://github.com/jdg/MBProgressHUD
  pod 'MBProgressHUD', '~> 1.1.0'
  #响应式编程框架
  #https://github.com/ReactiveX/RxSwift
  pod 'RxSwift', '5'
  # RxSwift版本
  pod 'Moya/RxSwift', '14.0.0'
   
  # JSON解析为对象
  # https://github.com/alibaba/HandyJSON
  pod 'HandyJSON', '5.0.2'
  # share sdk
  pod 'mob_sharesdk','4.3.16'
  
  # UI模块(非必须，需要用到ShareSDK提供的分享菜单栏和分享编辑页面需要以下1行)
  pod 'mob_sharesdk/ShareSDKUI','4.3.16'
  
  # 平台SDK模块(对照一下平台，需要的加上。如果只需要QQ、微信、新浪微博，只需要以下3行)
  pod 'mob_sharesdk/ShareSDKPlatforms/QQ','4.3.16'
  pod 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo','4.3.16'
  
  #微信sdk不带支付的命令
  #pod 'mob_sharesdk/ShareSDKPlatforms/WeChat','4.3.16'
  
  # 微信sdk带支付的命令，和上面不带支付的不能共存，只能选择一个
  pod 'mob_sharesdk/ShareSDKPlatforms/WeChatFull','4.3.16'
  
  # ShareSDKPlatforms模块其他平台，按需添加
  
  #pod 'mob_sharesdk/ShareSDKPlatforms/RenRen'
  #pod 'mob_sharesdk/ShareSDKPlatforms/AliPaySocial'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Kakao'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Yixin'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Facebook'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Messenger'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Copy'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Evernote'
  #pod 'mob_sharesdk/ShareSDKPlatforms/GooglePlus'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Instagram'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Instapaper'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Line'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Mail'
  #pod 'mob_sharesdk/ShareSDKPlatforms/SMS'
  #pod 'mob_sharesdk/ShareSDKPlatforms/WhatsApp'
  #pod 'mob_sharesdk/ShareSDKPlatforms/MeiPai'
  #pod 'mob_sharesdk/ShareSDKPlatforms/DingTalk'
  #pod 'mob_sharesdk/ShareSDKPlatforms/YouTube'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Twitter'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Dropbox'
  #pod 'mob_sharesdk/ShareSDKPlatforms/DingTalk'
  #pod 'mob_sharesdk/ShareSDKPlatforms/CMCC'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Telegram'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Reddit'
  #pod 'mob_sharesdk/ShareSDKPlatforms/DouBan'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Flickr'
  #pod 'mob_sharesdk/ShareSDKPlatforms/KaiXin'
  #pod 'mob_sharesdk/ShareSDKPlatforms/LinkedIn'
  #pod 'mob_sharesdk/ShareSDKPlatforms/MingDao'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Pinterest'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Pocket'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Print'
  #pod 'mob_sharesdk/ShareSDKPlatforms/TencentWeibo'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Tumblr'
  #pod 'mob_sharesdk/ShareSDKPlatforms/VKontakte'
  #pod 'mob_sharesdk/ShareSDKPlatforms/YouDaoNote'
  #pod 'mob_sharesdk/ShareSDKPlatforms/ESurfing'
  #pod 'mob_sharesdk/ShareSDKPlatforms/FacebookAccount'
  #pod 'mob_sharesdk/ShareSDKPlatforms/Douyin'
  
  # 使用配置文件分享模块（非必需）
  #pod 'mob_sharesdk/ShareSDKConfigFile'
  
  # 扩展模块（在调用可以弹出我们UI分享方法的时候是必需的）
  pod 'mob_sharesdk/ShareSDKExtension','4.3.16'
  #end share SDK
  target 'RXMisTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'RXMisUITests' do
    # Pods for testing
  end

end
