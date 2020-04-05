platform :osx, '10.15'

workspace 'SwiftTemplates.xcworkspace'
use_frameworks!
inhibit_all_warnings!

def test_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'SwiftTemplatesTests' do
  pod 'Sourcery', '~> 0.17.0'
  test_pods
end

