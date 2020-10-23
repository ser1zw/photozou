# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'photozou/version'

Gem::Specification.new do |spec|
  spec.name          = 'photozou'
  spec.version       = Photozou::VERSION
  spec.authors       = ['ser1zw']
  spec.email         = ['azariahsawtikes@gmail.com']

  spec.summary       = 'A Ruby interface to the Photozou (http://photozou.jp/) API'
  spec.homepage      = 'https://github.com/ser1zw/photozou'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1.4'
  spec.add_development_dependency 'rake', '~> 13.0.1'
end
