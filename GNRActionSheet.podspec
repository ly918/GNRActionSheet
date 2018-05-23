#
# Be sure to run `pod lib lint GNRActionSheet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GNRActionSheet'
  s.version          = '1.4'
  s.summary          = '一个简洁优雅的轻量级选项弹窗！'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ly918/GNRActionSheet'
  s.screenshots     = 'https://github.com/ly918/GNRActionSheet/blob/master/screenshots/shot_x.jpg?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ly918@qq.com' => 'ly918@qq.com' }
  s.source           = { :git => 'https://github.com/ly918/GNRActionSheet.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'GNRActionSheet/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GNRActionSheet' => ['GNRActionSheet/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Masonry'
  s.dependency 'GNRFoundation'

end
