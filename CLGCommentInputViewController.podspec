Pod::Spec.new do |s|

  s.name = 'CLGCommentInputViewController'

  s.version = '1.0.0'

  s.license = 'MIT'

  s.summary = 'A adaptive comment input view controller'

  s.homepage = 'https://github.com/creeveliu/CLGCommentInputViewController'

  s.author = { 'creeveliu' => 'creeveliu@foxmail.com' }

  s.source = { 
                :git => 'https://github.com/creeveliu/CLGCommentInputViewController.git',
                :commit => "94c809c8908af76def8d23567e55dde116ea457d", 
                :tag => '1.0.0'
              }

  s.platform = :ios

  s.ios.deployment_target = '8.0'

  s.source_files = 'CLGCommentInputViewController/*.{h,m}'
  s.resources = 'CLGCommentInputViewController/*.xib'
  s.requires_arc = true

end