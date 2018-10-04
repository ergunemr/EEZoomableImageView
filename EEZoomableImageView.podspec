Pod::Spec.new do |s|

  s.name         = "EEZoomableImageView"
  s.version      = "0.1.1"
  s.summary      = "Provides full screen zoom feature to image view like instagram. "

  s.homepage     = "https://github.com/ergunemr/EEZoomableImageView"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Emre" => "ergunemr@itu.edu.tr" }

  s.platform = :ios
  s.ios.deployment_target = '10.0'

  s.source       = { :git => "https://github.com/ergunemr/EEZoomableImageView.git", :tag => "#{s.version}" }

  s.source_files  = "EEZoomableImageView/EEZoomableImageView/*.{swift}"

  s.framework = "UIKit"

  s.swift_version = "3.0"

  s.requires_arc = true

end
