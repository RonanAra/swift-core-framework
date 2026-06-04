
Pod::Spec.new do |spec|

  spec.name         = "CoreFramework"
  spec.version      = "0.0.1"
  spec.summary      = "CoreFramework was developed for the Reminder app as a Design System (DS) solution"

  spec.description  = <<-DESC
		Este projeto tem o intuito de...
                   DESC

  spec.homepage     = "https://github.com/RonanAra/CoreFramework.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Ronan Fernandes" => "ronanlm10@hotmail.com" }
  spec.platform              = :ios, "13.0"
  spec.ios.deployment_target = "13.0"
  spec.source       = { :git => "https://github.com/RonanAra/swift-core-framework.git", :tag => "#{spec.version}" }
  spec.source_files  = "CoreFramework/Sources/**/*.{swift,h}"
  spec.exclude_files = "Classes/Exclude"

end
