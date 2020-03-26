Pod::Spec.new do |spec|
  spec.name         = 'SSJCircleButtonTabBarController'  #存储库名称
  spec.version      = '1.0.0'          #版本号，与tag值一致
  spec.summary      = '自定义的TabBarController' #简介
  spec.description  = '中间带圆形按钮的TabBarController'   #描述
  spec.homepage     = 'https://github.com/SSJStar/SSJCircleButtonTabBarController' #项目主页
  spec.license = { :type => "MIT", :file => "LICENSE" }  #开源协议
  spec.author             = { 'GreatFish' => '825551308@qq.com' } #作者
  spec.platform     = :ios, '9.0'  #支持的平台和版本号
  spec.source       = { :git => 'https://github.com/SSJStar/SSJCircleButtonTabBarController.git', :tag => '1.0.0' } #存储库的git地址，以及tag值
  spec.source_files  = 'SSJCircleButtonTabBarController/*.{h,m}','README.md','configure.json'
  spec.requires_arc = true #是否支持ARC
 #spec.swift_version = '4.2'#使用的swift版本
end