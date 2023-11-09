#
# Be sure to run `pod lib lint AppsPeopleiOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'AppsPeopleiOS'
    s.version          = '0.4.7'
    s.summary          = 'Internal iOS framework of Apps People'
    s.module_name      = 'AppsPeopleiOS'

    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC

    s.homepage         = 'https://github.com/Babluadroitminds/MyFirstPrivateLib'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Olivier Voyer' => 'olivier@appspeople.com.au' }
    s.source           = { :git => 'https://github.com/Babluadroitminds/MyFirstPrivateLib.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

    s.ios.deployment_target = '12.0'
    s.swift_version = '5.0'

    # https://github.com/CocoaPods/CocoaPods/issues/5334
    s.pod_target_xcconfig = { 'LD_RUNPATH_SEARCH_PATHS' => '$(FRAMEWORK_SEARCH_PATHS)' }

    s.default_subspec = 'All'

    s.subspec 'All' do |all|
        all.dependency 'AppsPeopleiOS/Core'
        all.dependency 'AppsPeopleiOS/UI'
        all.dependency 'AppsPeopleiOS/UserNotifications'
        all.dependency 'AppsPeopleiOS/Location'
        all.dependency 'AppsPeopleiOS/Preferences'
    end

    s.subspec 'Core' do |core|
        core.source_files = 'AppsPeopleiOS/Core/Classes/**/*'
        core.frameworks = 'Foundation', 'AudioToolbox'
    end

    s.subspec 'Location' do |location|
        location.source_files = 'AppsPeopleiOS/Location/Classes/**/*'
        location.frameworks = 'CoreLocation'
        location.dependency 'AppsPeopleiOS/Core'
    end

    s.subspec 'Preferences' do |preferences|
        preferences.source_files = 'AppsPeopleiOS/Preferences/Classes/**/*'
        preferences.dependency 'AppsPeopleiOS/Core'
        preferences.dependency 'KeychainAccess'
    end

    s.subspec 'UI' do |ui|
        ui.source_files = 'AppsPeopleiOS/UI/Classes/**/*'
        ui.frameworks = 'UIKit', 'SafariServices'
        ui.dependency 'AppsPeopleiOS/Core'
        ui.dependency 'PPTopMostController'
        ui.dependency 'Toucan'
    end

    s.subspec 'UserNotifications' do |userNotifications|
        userNotifications.source_files = 'AppsPeopleiOS/UserNotifications/Classes/**/*'
        userNotifications.frameworks = 'UserNotifications'
        userNotifications.dependency 'AppsPeopleiOS/Core'
    end

    s.subspec 'Extras' do |extras|
        extras.dependency 'AppsPeopleiOS/Core'
        extras.subspec 'AKSideMenu' do |akSideMenu|
            akSideMenu.source_files = 'AppsPeopleiOS/Extras/Classes/AKSideMenu/Classes/**/*'
            akSideMenu.dependency 'AKSideMenu'
        end
        # [!] The 'Pods-AppsPeopleiOS_Example' target has transitive dependencies that include statically linked binaries: (FirebaseCore, FirebaseCoreDiagnostics, GoogleDataTransportCCTSupport, GoogleDataTransport, and FirebaseInstanceID)
        # extras.subspec 'FirebaseRemoteConfig' do |firebaseRemoteConfig|
        # firebaseRemoteConfig.source_files = 'AppsPeopleiOS/Extras/Classes/FirebaseRemoteConfig/Classes/**/*'
        # firebaseRemoteConfig.dependency 'Firebase/Core'
        # firebaseRemoteConfig.dependency 'Firebase/RemoteConfig'
        # end
        extras.subspec 'Starscream' do |starscream|
            starscream.source_files = 'AppsPeopleiOS/Extras/Classes/Starscream/Classes/**/*'
            starscream.dependency 'Starscream'
        end
        extras.subspec 'SwiftLocation' do |swiftLocation|
            swiftLocation.source_files = 'AppsPeopleiOS/Extras/Classes/SwiftLocation/Classes/**/*'
            swiftLocation.frameworks = 'CoreLocation'
            swiftLocation.dependency 'SwiftLocation', '~> 4.0'
        end
    end

    # s.resource_bundles = {
    #   'AppsPeopleiOS' => ['AppsPeopleiOS/Assets/*.png']
    # }

    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
