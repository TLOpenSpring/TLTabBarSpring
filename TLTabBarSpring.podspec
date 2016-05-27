#
# Be sure to run `pod lib lint TLTabBarSpring.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TLTabBarSpring'
  s.version          = '1.0.0'
  s.summary          = 'swift中自定义的Tabbar,支持图标和文字的动画效果.API简单易用'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"自定义的Tabbar,支持图标和文字的动画效果"
                       DESC

  s.homepage         = 'https://github.com/TLOpenSpring/TLTabBarSpring'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andrew' => 'anluanlu123@163.com' }
  s.source           = { :git => 'https://github.com/TLOpenSpring/TLTabBarSpring.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TLTabBarSpring/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TLTabBarSpring' => ['TLTabBarSpring/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
