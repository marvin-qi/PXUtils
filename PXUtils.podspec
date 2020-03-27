Pod::Spec.new do |s|

  s.name         = "PXUtils"
  s.version      = "2.9.6"
  s.summary      = "iOS开发工具类"

  s.homepage     = "http://github.com/DemonArrow/PXUtils.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "DemonArrow" => "qipengxiang1990@163.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/DemonArrow/PXUtils.git", :tag => "#{s.version}" }

  s.source_files  = "PXUtils/*.{h,m}"
  s.subspec 'PXObject' do |ss|
    ss.source_files = "PXUtils/PXObject/*.{h,m}"
  end
  s.subspec 'PXKit' do |ss|
    ss.source_files = "PXUtils/PXKit/*.{h,m}"
  end
  s.subspec 'PXDebug' do |ss|
    ss.source_files = "PXUtils/PXDebug/*.{h,m}"
  end
  s.subspec 'PXSecurity' do |ss|
    ss.source_files = "PXUtils/PXSecurity/*.{h,m}"
  end

end
