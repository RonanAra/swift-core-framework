Pod::Spec.new do |spec|

  spec.name                  = "CoreFramework"
  spec.version               = "1.0.2"
  spec.summary               = "CoreFramework foi desenvolvido para o app Reminder como core de design e de componentes a serem utilizados pela equipe ReminderTeam."

  spec.description           = <<-DESC
                   Este projeto tem o intuito de...
  DESC

  spec.homepage              = "http://github.com/RonanAra/swift-core-framework.git"
  spec.license               = { :type => "MIT", :file => "LICENSE" }
  spec.author                = { "Ronan Fernandes" => "ronanlm10@hotmail.com" }
  spec.platform              = :ios, "13.0"
  spec.ios.deployment_target = "13.0"
  spec.source                = { :git => "https://github.com/RonanAra/swift-core-framework.git", :tag => "#{spec.version}" }
  spec.source_files          = "CoreFramework/Sources/**/*.{swift,h}"
  spec.exclude_files         = "Classes/Exclude"
  
end
