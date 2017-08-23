#
#  Be sure to run `pod spec lint HePaiPay.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LLGobang"
  s.version      = "1.0.0"
  s.summary      = "use for Lilong LLGobang module."
  s.description  = <<-DESC
		   use for LLGobang module.
		   It’s awesome!!
                   DESC

  s.homepage     = "https://github.com/LiGuanWen/LLGobang"
  s.license      = "MIT"
  s.author       = { "Lilong" => "diqidaimu@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/LiGuanWen/LLGobang.git", :branch => "#{s.version}" }
  s.source_files  = "LLGobangClass/**/*.{h,m,mm,a,framework}","LLGobangClass/LLGobangPrefixHeader.pch"
  s.resources    = "LLGobangClass/**/*.xib","LLGobangClass/**/*.bundle","LLGobangClass/**/*.xcassets"
  # s.prefix_header_file = 'LLDBClass/LLBuyPrefixHeader.pch'    #PCH文件
  
  #s.vendored_frameworks = "HePaiClub/util/thirdpart/Alipay/AlipaySDK.framework"
  #s.frameworks  = "AlipaySDK"
  #s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PODS_ROOT)/HePaiPay/HePaiPay/util/thirdpart/Alipay/' }
  #s.frameworks = "HePaiPay/**/*.{h,m,a,framework}"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  # s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  #s.dependency "AFNetworking"
  # s.dependency "LLKit", "~> 1.0.0"
  # s.dependency "WCDB"
end
