Pod::Spec.new do |s|
    s.name         = 'FoursquareKit'
    s.version      = '1.0.0'
    s.summary      = 'Integrate Foursquare API into your apps'
    s.homepage = "https://github.com/remirobert/foursquare-kit-ios"
    s.license      = 'MIT'
    s.author       = { 'Remi ROBERT' => 'remirobert33530@gmail.com' }
    s.source       = { :git => 'https://github.com/remirobert/foursquare-kit-ios.git', :tag => s.version }

    s.source_files = 'FoursquareKit/**/*.{swift,h,m}'
    s.requires_arc = true

    s.ios.deployment_target = '9.0'
    s.ios.frameworks = 'Foundation'
end