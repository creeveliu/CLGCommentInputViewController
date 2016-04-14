Pod::Spec.new do |s|

  s.name = 'CLGCommentInputViewController'

  s.version = '1.0.0'

  s.license = 'MIT'

  s.summary = 'A adaptive comment input view controller'

  s.homepage = 'https://github.com/creeveliu/CLGCommentInputViewController'

  s.author = { 'creeveliu' => 'creeveliu@foxmail.com' }

  s.source = { 
                :git => 'https://github.com/creeveliu/CLGCommentInputViewController.git', 
                :tag => '1.0.0'
              }

  s.platform = :ios
  
  s.ios.deployment_target = '8.0'

  s.source_files = 'CLGCommentInputViewController/*'

  s.requires_arc = true

end