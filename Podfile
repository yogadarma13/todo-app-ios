# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ToDo App' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ToDo App
  pod 'Swinject'
  pod 'SwinjectStoryboard'
  pod 'NVActivityIndicatorView'

  target 'ToDo AppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ToDo AppUITests' do
    # Pods for testing
  end

end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end
