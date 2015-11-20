#
# Be sure to run `pod lib lint DataBindingLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DataBindingLib"
  s.version          = "1.0.0"
  s.summary          = "Data Binding for iOS"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description      = "这是一个参考自Android DataBinding (http://developer.android.com/tools/data-binding/guide.html) 的库,其用法与Android 的 DataBinding非常相似 通过 xib 的 User Defined Runtime Attributes 实现对model的绑定(类似于Android xml 的 binding),设置绑定模型与绑定方法,

This is a lib base on 'Android DataBinding' (http://developer.android.com/tools/data-binding/guide.html) , It use like Android DataBinding , You can bind model and method through 'User Defined Runtime Attributes'

Forgive my poor English , There is no English Document and Notes , but if you interested ,just send me a Email,i will tell you how to use and how it work . and hopely you can help me to write English document and notes... My Email address : d.halin.lee@gmail.com

"

  s.homepage         = "https://github.com/Halin-Lee/DataBinding-for-iOS"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Halin" => "d.halin.lee@gmail.com" }
  s.source           = { :git => "https://github.com/Halin-Lee/DataBinding-for-iOS.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DataBindingLib' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
