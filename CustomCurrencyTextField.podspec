#
# Be sure to run `pod lib lint CustomCurrencyTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CustomCurrencyTextField'
  s.version          = '0.1.0'
  s.summary          = 'Helps to use single Text Field with currency format.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Helps to use single Text Field with currency format.
  Allows customizing the text field with the required currency symbol, separator character, integer part length, and the number of decimals.
  
  Use IB_DESIGNABLE to customize the field directly in the Storyboard.
  You can set the following properties:
  
  - Symbol (String): currency symbol ($ by default)
  - Comma for decimals (BOOL): character separator, if YES uses (.) as integer separator and (,) as decimal separator. If NO uses (,) as integer separator and (,) as decimal separator.
  - Integers (Int): integer part length, 7 by default.
  - Decimals (Int): number of decimals, 0 by default.
                       DESC

  s.homepage         = 'https://github.com/hajc1294/CustomCurrencyTextField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hajc1294' => 'hajc1294@gmail.com' }
  s.source           = { :git => 'https://github.com/hajc1294/CustomCurrencyTextField.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'CustomCurrencyTextField/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CustomCurrencyTextField' => ['CustomCurrencyTextField/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
