Pod::Spec.new do |s|

  s.name         = "PXUtils"
  s.version      = "1.0.0"
  s.summary      = "iOS开发重用工具类"

  s.homepage     = "http://github.com/DemonArrow/PXUtils.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "DemonArrow" => "qipengxiang1990@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/DemonArrow/PXUtils.git", :tag => "#{s.version}" }

  s.source_files  = "PXUtils/*.{h,m}"
  s.subspec 'NSObject' do |ss|
    ss.source_files = "PXUtils/NSObject/**/*.{h,m}"
  end
  s.subspec 'UIKit' do |ss|
    ss.source_files = "PXUtils/UIKit/**/*.{h,m}"
  end
  s.resource_bundles = "PXUtils/Resource/*.ttf"
  s.dependency 'YYWebImage', '~> 1.0.5'
  s.requires_arc = true

end