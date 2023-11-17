#
# Be sure to run `pod lib lint EasyCodable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyCodable'
  s.version          = '1.2'
  s.summary          = 'A short description of EasyCodable.'
  s.swift-version     = '5.0'
  s.description      = 'a'
  s.homepage         = 'https://github.com/Zoro4rk/EasyCodable'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zoro4rk' => 'thuyetngocluong@gmail.com' }
  s.source           = { :git => 'https://github.com/thuyetngocluong/EasyCodable.git', :tag => '1.2' }
  
  s.ios.deployment_target = '12.0'

  s.source_files = 'Source/**/*'

end
