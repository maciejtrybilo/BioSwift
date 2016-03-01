Pod::Spec.new do |s|
  s.name = 'BioSwift'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'Bioinformatics in Swift'
  s.homepage = 'https://github.com/maciejtrybilo/BioSwift'
  s.social_media_url = 'http://twitter.com/maciejtrybilo'
  s.authors = { 'Maciej Trybilo' => 'maciektr@gmail.com' }
  s.source = { :git => 'https://github.com/maciejtrybilo/BioSwift.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'

  s.source_files = 'BioSwift/*.swift'

  s.requires_arc = true
end
