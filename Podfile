# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

target 'match3' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for match3
  pod 'OneSignal/OneSignal', '>= 5.0.0', '< 6.0'
  pod 'OneSignal/OneSignalLocation', '>= 5.0.0', '< 6.0'
  pod 'OneSignal/OneSignalInAppMessages', '>= 5.0.0', '< 6.0'
  pod 'FirebaseAnalytics'
  pod 'FirebaseFirestore'

  post_install do |installer|
    installer.aggregate_targets.each do |target|
      target.xcconfigs.each do |variant, xcconfig|
        xcconfig_path = target.client_root + target.xcconfig_relative_path(variant)
        IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
      end
    end
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        if config.base_configuration_reference.is_a? Xcodeproj::Project::Object::PBXFileReference
          xcconfig_path = config.base_configuration_reference.real_path
          IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
        end
      end
    end
  end

  end

target 'OneSignalNotificationServiceExtension' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'OneSignal/OneSignal', '>= 5.0.0', '< 6.0'
  pod 'OneSignal/OneSignalLocation', '>= 5.0.0', '< 6.0'
  pod 'OneSignal/OneSignalInAppMessages', '>= 5.0.0', '< 6.0'
end
