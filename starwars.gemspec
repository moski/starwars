# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'starwars/version'

Gem::Specification.new do |spec|
  spec.name          = 'starwars'
  spec.version       = Starwars::VERSION
  spec.authors       = ['Moski Doski']
  spec.email         = ['moski.doski@gmail.com']
  spec.summary       = 'A Ruby helper library for swapi.co - the Star Wars API'
  spec.description   = 'A Ruby interface to the awesome swapi.co api, it matches each api with a resource and method'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_dependency 'roar', '~> 1.0.0'
  spec.add_dependency 'equalizer', '~> 0.0.9'
  spec.add_dependency 'virtus', '~> 1.0.3'
end
