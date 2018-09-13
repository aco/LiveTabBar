#
# Be sure to run `pod lib lint LiveTabBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LiveTabBar'
  s.version          = '1.0'
  s.summary          = 'Animated tab bar items and badges for iOS apps'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
LiveTabBarController can be used in place of UITabBarController to set and configure animated tab bar items and badge appearances.
                       DESC

  s.homepage         = 'https://github.com/cewpur/LiveTabBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cewpur' => 'cewp3r@gmail.com' }
  s.source           = { :git => 'https://github.com/cewpur/LiveTabBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Classes/**/*.swift'
  s.swift_version    = '4.1'
  # s.resource_bundles = {
  #   'LiveTabBar' => ['LiveTabBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
